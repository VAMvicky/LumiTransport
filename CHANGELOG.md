<div align="center">

# 📝 Catatan Perubahan · Changelog

**🌐 Bahasa / Language:** ketuk bagian di bawah untuk membuka / tap a section below to expand it

[⬅️ README (ID)](README.md) · [⬅️ README (EN)](README.en.md)

</div>

---

## ✦ v2.8 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Laporkan halte/rute salah** dari detail perjalanan; issue sudah terisi asal/tujuan, koordinat, kode rute, versi, dan user agent
- **Bahasa Inggris diperluas** ke langkah perjalanan (*Get ready to alight*, *Alight now*, *Walk*, *Depart*, *Arrive*, *Board*, *Alight*) dan satuan menit/transit

### 🔧 Teknis

- `versionCode` **20800**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Report a wrong stop/route** from the trip detail; the issue is pre-filled with origin/destination, coordinates, route codes, version and user agent
- **Broader English coverage**: trip steps (*Get ready to alight*, *Alight now*, *Walk*, *Depart*, *Arrive*, *Board*, *Alight*) plus minute/transfer units

### 🔧 Technical

- `versionCode` **20800**

</details>

---

## ✦ v2.7 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Panduan suara**: langkah pendampingan dibacakan, hanya saat berubah; berhenti bersama pendampingan
- **Tata letak dua panel** untuk tablet/foldable: daftar langkah di kiri, peta di kanan

### 🔧 Teknis

- `versionCode` **20700**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Voice guidance**: guidance steps are spoken, only when they change, and stop with the guidance
- **Two-pane layout** for tablets/foldables: steps on the left, map on the right

### 🔧 Technical

- `versionCode` **20700**

</details>

---

## ✦ v2.6 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Pilihan bahasa Indonesia / English** di Pengaturan
- Terjemahan mencakup header, kolom asal-tujuan, tombol, tab, navigasi, judul sheet, kartu Pengaturan, dan Tentang
- Bahasa awal mengikuti bahasa HP; mengganti balik ke Indonesia memulihkan teks asli

### 🔧 Teknis

- `versionCode` **20600**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Indonesian / English language switch** in Settings
- Translation covers the header, origin/destination fields, buttons, tabs, navigation, sheet titles, Settings cards and About
- The initial language follows the phone; switching back to Indonesian restores the original text

### 🔧 Technical

- `versionCode` **20600**

</details>

---

## ✦ v2.5 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Mode aksesibel**: area sentuh minimal 52 px, teks diperbesar, animasi mengikuti setelan "kurangi animasi" HP

### 🔧 Teknis

- **targetSdk 35** dengan **edge-to-edge**: konten WebView diberi padding setinggi status bar + navigation bar
- Sisa kode migrasi gaya peta pra-2.0 dihapus
- `versionCode` **20500**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Accessible mode**: minimum 52 px tap targets, larger text, animations follow the system "reduce motion" setting

### 🔧 Technical

- **targetSdk 35** with **edge-to-edge**: the WebView is padded by the status and navigation bar heights
- Remaining pre-2.0 map-style migration code removed
- `versionCode` **20500**

</details>

---

## ✦ v2.4 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Widget "Berangkat / Pulang"**: dua tombol di layar utama, langsung membuka kolom asal atau tujuan
- **Cadangkan & pulihkan**: bagikan cadangan berisi pengaturan, favorit, riwayat, dan tempat tersimpan; pulihkan dengan menempel teksnya

### 🔧 Teknis

- Job rilis menolak tag yang tidak menunjuk kepala `main`
- `versionCode` **20400**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **"Leave / Home" widget**: two home-screen buttons that open the origin or destination field
- **Backup & restore**: share a backup containing settings, favourites, history and saved places; restore by pasting the text

### 🔧 Technical

- Release job rejects tags that do not point at the head of `main`
- `versionCode` **20400**

</details>

---

## ✦ v2.3 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Rute favorit**: simpan asal → tujuan (maks 20), lalu hitung ulang dengan satu ketuk **Pakai**
- **App shortcuts**: tekan lama ikon → **Cari rute** atau **Riwayat**
- **Ubin Quick Settings "Cari rute"**: satu ketuk dari panel notifikasi

### 🔧 Teknis

- Pintasan dari intent disimpan sampai halaman WebView siap, lalu dikirim ke `window.__lumiShortcut`
- `versionCode` **20300**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Favourite routes**: save origin → destination (max 20), recompute with one tap
- **App shortcuts**: long-press the icon → **Search route** or **History**
- **Quick Settings tile "Search route"**

### 🔧 Technical

- Intent shortcuts are held until the WebView page is ready, then delivered to `window.__lumiShortcut`
- `versionCode` **20300**

</details>

---

## ✦ v2.2 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Tentang Lumi** kini menampilkan versi otomatis, lisensi GPL-3.0, tautan repo, tombol **Cek update** (GitHub Releases), dan **Laporkan masalah** (issue baru berisi versi + user agent)
- **Riwayat perjalanan & ongkos**: tiap pendampingan yang dimulai tercatat (asal, tujuan, tanggal, menit, ongkos, moda), lengkap dengan ringkasan **bulan berjalan** dan tombol hapus

### 🔧 Perbaikan

- Teks setelan alamat: pencarian OpenStreetMap di aplikasi sebagai cara utama, Google Maps lewat Bagikan sebagai cadangan
- `versionCode` **20200**

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **About** now shows the automatic version, GPL-3.0 licence, repository link, **Check for updates** (GitHub Releases) and **Report an issue** (prefilled version + user agent)
- **Trip history & fares**: each started guidance session is recorded (origin, destination, date, minutes, fare, modes), with a **current month** summary and a clear button

### 🔧 Fixes

- Address settings text: in-app OpenStreetMap search first, Google Maps via Share as fallback
- `versionCode` **20200**

</details>

---

## ✦ v2.1 — 9 November 2026 / 9 November 2026

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Cari alamat di dalam aplikasi**: ketik ≥ 3 huruf di kolom asal/tujuan dan saran alamat muncul langsung dari **OpenStreetMap (Photon)** — tanpa API key, tanpa keluar aplikasi
- Hasil disaring ke **Indonesia** dengan bias **Jabodetabek**
- Baris **"Cari … di Google Maps"** dan alur **Bagikan → Lumi Transport** tetap ada untuk alamat yang tidak ditemukan OSM

### 🔧 Teknis

- Build pindah ke **Gradle 8.7** + `gradle/libs.versions.toml` (satu katalog versi)
- **R8 + `shrinkResources`** aktif, dengan aturan keep untuk jembatan `LumiNative`
- Rilis APK diambil dari build Gradle; `versionCode` **20100**
- **User-Agent tunggal** dari `versionName`

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **In-app address search**: type at least 3 characters in the origin/destination field and suggestions appear from **OpenStreetMap (Photon)** — no API key, no leaving the app
- Results filtered to **Indonesia** and biased to **Greater Jakarta**
- The **"Search … on Google Maps"** row and the **Share → Lumi Transport** flow remain for addresses OSM does not have

### 🔧 Technical

- Build moved to **Gradle 8.7** + `gradle/libs.versions.toml`
- **R8 + `shrinkResources`** enabled, with keep rules for the `LumiNative` bridge
- Release APK now comes from the Gradle build; `versionCode` **20100**
- **Single User-Agent** derived from `versionName`

</details>

---

## ✦ v2.0 — rilis pertama

<details open>
<summary><h2>🇮🇩 Bahasa Indonesia</h2></summary>

### ✨ Baru

- **Perencana perjalanan semua moda Jabodetabek**: Transjakarta, Mikrotrans, Royaltrans, Transjabodetabek, KRL, MRT, LRT Jabodebek, KA Bandara, Whoosh, dan ojol dalam satu rute
- **Semua kombinasi rute** ditampilkan sebagai opsi sendiri, dengan urutan Tercepat (angkutan umum), Termurah, dan Minim transit
- **Posisi bus langsung**: bus di sekitarmu, bus berikutnya tiba di halte naik, dan semua bus satu rute
- **Pendampingan GPS** dengan pengingat "Siap-siap turun" dan "Turun sekarang", termasuk saat layar mati
- **Tarif akurat** untuk Transjakarta, Mikrotrans, MRT, LRT Jabodebek, KA Bandara, SH2, dan Hub Connector
- **Notifikasi perubahan rute** dari pemeriksaan data resmi tiap jam
- **Bagikan rute sebagai gambar** ke WhatsApp, Instagram, atau aplikasi lain
- **Ringkasan GTFS terbaru di dalam APK**, jadi aplikasi langsung lengkap tanpa unduhan pertama

### 🔧 Teknis

- `applicationId` `id.lumi.transport`, nama **Lumi Transport**
- **minSdk 26** (Android 8.0+), targetSdk 34
- `versionName` dari `release-notes/CURRENT`, `versionCode` deterministik: `2.0` → 20000, `2.1` → 20100, `2.1.1` → 20101
- Perhitungan rute berjalan di HP, tanpa server

</details>

<details>
<summary><h2>🇬🇧 English</h2></summary>

### ✨ New

- **Multi-modal trip planner for Greater Jakarta**: Transjakarta, Mikrotrans, Royaltrans, Transjabodetabek, KRL, MRT, LRT Jabodebek, Airport Rail, Whoosh, and ride-hailing in a single trip
- **Every sensible combination** shown as its own option, sortable by Fastest (public transport), Cheapest, or Fewest transfers
- **Live bus positions**: buses around you, the next bus arriving at your boarding stop, and all buses on a route
- **GPS guidance** with "Get ready to alight" and "Alight now" reminders, even with the screen off
- **Accurate fares** for Transjakarta, Mikrotrans, MRT, LRT Jabodebek, Airport Rail, SH2, and Hub Connector
- **Route change notifications** from hourly checks of the official data
- **Share a trip as an image** to WhatsApp, Instagram, or any other app
- **Latest GTFS summary bundled in the APK**, so the app is complete without a first download

### 🔧 Technical

- `applicationId` `id.lumi.transport`, name **Lumi Transport**
- **minSdk 26** (Android 8.0+), targetSdk 34
- `versionName` from `release-notes/CURRENT`, deterministic `versionCode`: `2.0` → 20000, `2.1` → 20100, `2.1.1` → 20101
- Routing runs on-device, no server

</details>
