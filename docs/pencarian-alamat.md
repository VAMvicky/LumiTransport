# Pencarian alamat: apa yang sebenarnya dipakai Google Maps

Catatan investigasi untuk fitur "ketik alamat → muncul saran seperti Google Maps" di Lumi Transport.
Disusun dari APK Google Maps 26.44.06 (APKMirror bundle), **tanpa menjalankan aplikasi** dan tanpa memanggil endpoint internalnya.

## Artefak yang diperiksa

| | |
|---|---|
| Berkas | `com.google.android.apps.maps_26.44.06..._apkmirror.com.apkm` (63,7 MB) |
| SHA-256 bundle | `9beffe7bc0581ad677477b164c6b11a9c5d9434b56620954776eddbb89b83e57` |
| `base.apk` | 78.196.674 byte, 4.397 entri |
| Kode | 10 `classes*.dex` (~75 MB) |
| Versi | 26.44.06 (versionCode 1068856906) |

## Temuan

**1. Saran alamat dilayani backend internal, bukan Places API publik.**

Di seluruh 10 dex tidak ada satu pun string `places.googleapis.com` atau `/maps/api/place`. Yang ada:

- `mobilemaps.googleapis.com`
- `mobilemaps-pa.googleapis.com:443`
- `mobilemaps-pa-gz.googleapis.com:443`

Ketiganya host internal Maps for Android, dipanggil dengan kredensial akun + API key aplikasi, dan berbicara protobuf — bukan REST JSON publik.

**2. Kelas yang menangani autocomplete memang internal.**

- `com.google.android.apps.gmm.car.destinationinput.autocompletesuggestions.api.AutoCompleteSuggestionsUseCase$AutoCompleteSuggestionsResult`
- `com.google.android.apps.gmm.ui.components.terra.textfield.AutoCompleteAdapter`
- `ADDRESS_AUTOCOMPLETE_CONTROLLER`, `SearchBoxVisibility`, `SearchBoxInteractivity`
- Tipe respons berupa entity protobuf (`...EvPredictionEntity`), bukan `AutocompletePrediction` milik Places SDK.

**3. API key tertanam, tetapi tidak bisa dipakai ulang.**

Ditemukan beberapa string `AIza…` di dalam dex. Itu key milik Google Maps yang dibatasi:
- **Application restriction**: hanya untuk package `com.google.android.apps.maps` + sertifikat tanda tangan Google;
- **API restriction**: hanya untuk API internal yang dipakai Maps.

Memakainya dari aplikasi lain akan ditolak server, dan menyalinnya melanggar ToS. Karena itu key tersebut **tidak dicantumkan** di dokumen ini.

**4. Meniru endpoint internal bukan jalan yang layak.**

`mobilemaps.googleapis.com` butuh sesi akun Google dan protobuf yang berubah antar versi. Menyadapnya berarti scraping: rapuh, melanggar ToS, dan bisa memutus akses pengguna. Ini sengaja **tidak** diuji.

## Artinya untuk Lumi Transport

Saran alamat yang "persis seperti Google Maps" hanya bisa didapat lewat produk resmi Google, dengan **API key milik Lumi sendiri dan billing aktif**. Tidak ada jalan gratis yang resmi.

## Opsi implementasi

| Opsi | Cara | Biaya | Kualitas alamat Indonesia | Dampak ke build |
|---|---|---|---|---|
| **A. Places API (New) — Autocomplete via HTTPS** | `POST places.googleapis.com/v1/places:autocomplete` dari Java (`HttpURLConnection`) | Berbayar per request, ada kuota gratis bulanan | Terbaik | **Bisa sekarang**, tanpa Gradle/AAR |
| B. Places SDK for Android | dependency `com.google.android.libraries.places` | Sama seperti A | Terbaik + UI siap | Butuh Gradle (AAR), belum bisa dengan `build.sh` |
| C. OSM (Photon/Nominatim) | HTTP ke instance publik atau self-host | Gratis | Cukup untuk jalan, lemah untuk alamat detail | Bisa sekarang |
| D. Hybrid | Data halte Lumi + OSM + Google opsional (key pengguna) | Gratis, Google opsional | Baik, tergantung key | Bisa sekarang |

**Rekomendasi:** **A** kalau ada billing, **C/D** kalau harus gratis. Opsi B ditunda sampai build pindah ke Gradle.

## Rancangan A (Places API New, tanpa Gradle)

1. `PlacesAutocomplete.java` — `HttpURLConnection` POST ke `https://places.googleapis.com/v1/places:autocomplete`
   - header `X-Goog-Api-Key`, `X-Goog-FieldMask: suggestions.placePrediction.placeId,suggestions.placePrediction.text,suggestions.placePrediction.structuredFormat,suggestions.placePrediction.distanceMeters`
   - body: `{"input": "...", "languageCode": "id", "regionCode": "ID", "includedRegionCodes": ["ID"], "locationBias": {"circle": {"center": {"latitude": -6.2, "longitude": 106.816}, "radius": 50000}}}`
2. Session token (`sessionToken`) dipakai selama satu sesi pencarian supaya penagihan lebih murah.
3. `app.js`: kotak cari dengan debounce 250 ms → daftar saran → pilih → `Place Details` untuk `location.latitude/longitude` → isi asal/tujuan.
4. Pembatasan key: **Application restrictions → Android** (package `id.lumi.transport` + SHA-1 sertifikat), **API restrictions → Places API (New)**.
5. Fallback: kalau jaringan gagal atau kuota habis, pakai pencarian halte lokal yang sudah ada.

## Yang belum terjawab

- Harga per SKU dan besaran kuota gratis berubah-ubah; cek halaman resmi Google Maps Platform sebelum mengaktifkan billing.
- Kualitas hasil untuk alamat kampung/ gang di Jabodetabek perlu diuji dengan ~20 alamat nyata sebelum diputuskan.
