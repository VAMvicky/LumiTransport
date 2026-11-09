#!/usr/bin/env bash
# Build APK Lumi Transport tanpa Gradle (javac + d8 + aapt2 + apksigner).
#
# Versi diambil dari satu sumber: release-notes/CURRENT (mis. "2.0").
# versionCode deterministik: 2.0 -> 20000, 2.1 -> 20100, 2.1.1 -> 20101.
#
# Kebutuhan (variabel lingkungan, atau taruh di folder tools/sdk):
#   ANDROID_JAR  : android.jar platform API 34
#   AAPT2        : biner aapt2
#   D8_JAR       : d8.jar (r8)
#   APKSIGNER_JAR: apksigner.jar
#   ECJ_JAR      : ecj.jar (Eclipse Java compiler)
#   KEYSTORE     : keystore untuk tanda tangan (dibuat otomatis jika belum ada)
#
# Alternatif: buka folder ini di Android Studio dan jalankan Build > Build APK
# (memakai build.gradle yang sudah disertakan).
set -euo pipefail
cd "$(dirname "$0")"
SDK=${SDK:-tools/sdk}
ANDROID_JAR=${ANDROID_JAR:-$SDK/android.jar}
AAPT2=${AAPT2:-$SDK/aapt2}
D8_JAR=${D8_JAR:-$SDK/d8.jar}
APKSIGNER_JAR=${APKSIGNER_JAR:-$SDK/apksigner.jar}
KEYSTORE=${KEYSTORE:-lumi-release.keystore}
KS_PASS=${KS_PASS:-lumi123}
KS_ALIAS=${KS_ALIAS:-lumi}
MIN_SDK=26
TARGET_SDK=34
OUT=build
APP=app/src/main

VER=""
CODE=""
read -r VER CODE < <(bash tools/version.sh)
APK_NAME="LumiTransport-v$VER.apk"
echo "versi: $VER (versionCode $CODE, minSdk $MIN_SDK)"

rm -rf "$OUT" && mkdir -p "$OUT"/{res,classes,dex,gen}

echo "1/6 data rute"
python3 tools/build_data.py

echo "2/6 kompilasi resource"
"$AAPT2" compile --dir "$APP/res" -o "$OUT/res/res.zip"
"$AAPT2" link -o "$OUT/base.apk" -I "$ANDROID_JAR" \
  --manifest "$APP/AndroidManifest.xml" -A "$APP/assets" \
  --java "$OUT/gen" --min-sdk-version "$MIN_SDK" --target-sdk-version "$TARGET_SDK" \
  --version-code "$CODE" --version-name "$VER" -0 woff2 "$OUT/res/res.zip"

echo "3/6 kompilasi Java (ecj)"
ECJ_JAR=${ECJ_JAR:-$SDK/ecj.jar}
java -jar "$ECJ_JAR" -8 -nowarn -encoding UTF-8 -bootclasspath "$ANDROID_JAR" \
  -d "$OUT/classes" $(find "$APP/java" "$OUT/gen" -name '*.java')
test -f "$OUT/classes/id/lumi/transport/MainActivity.class"

echo "4/6 d8 (dex)"
java -cp "$D8_JAR" com.android.tools.r8.D8 --release --min-api "$MIN_SDK" --lib "$ANDROID_JAR" \
  --output "$OUT/dex" $(find "$OUT/classes" -name '*.class')

echo "5/6 kemas + zipalign"
cp "$OUT/base.apk" "$OUT/unaligned.apk"
(cd "$OUT/dex" && zip -q -X ../unaligned.apk classes.dex)
python3 tools/zipalign.py "$OUT/unaligned.apk" "$OUT/aligned.apk"

echo "6/6 tanda tangan"
if [ ! -f "$KEYSTORE" ]; then
  keytool -genkeypair -keystore "$KEYSTORE" -alias "$KS_ALIAS" -keyalg RSA -keysize 2048 -validity 10000 \
    -storepass "$KS_PASS" -keypass "$KS_PASS" -dname "CN=Lumi Transport, O=Lumi, C=ID" >/dev/null 2>&1
fi
java -jar "$APKSIGNER_JAR" sign --ks "$KEYSTORE" --ks-pass "pass:$KS_PASS" --key-pass "pass:$KS_PASS" \
  --ks-key-alias "$KS_ALIAS" --min-sdk-version "$MIN_SDK" --out "$OUT/$APK_NAME" "$OUT/aligned.apk"
java -jar "$APKSIGNER_JAR" verify --verbose "$OUT/$APK_NAME" | head -5
ls -la "$OUT/$APK_NAME"
