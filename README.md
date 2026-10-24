# ⚡ GEN SSH STORE PREMIUM TUNNELING VIP ⚡
Autoscript High Performance Tunneling (SSH WS, Xray VMess, VLess, Trojan, Shadowsocks).

---

### 1️⃣ METODE 1: INSTALL LANGSUNG (STANDAR - VIA CURL)
Gunakan perintah ini untuk instalasi langsung sekali klik (otomatis aman tanpa kendala wget):
```bash
apt update -y && apt install -y curl && curl -sSL https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/premi.sh -o premi.sh && chmod +x premi.sh && ./premi.sh
```

---

### 2️⃣ METODE 2: INSTALL DI LATAR BELAKANG (ANTI PUTUS / SINYAL HILANG)
Gunakan metode ini jika sinyal HP/Laptop Anda sering putus. Instalasi akan berjalan di latar belakang dan **TIDAK AKAN BERHENTI** meskipun koneksi Anda terputus:

**Jalankan instalasi:**
```bash
apt update -y && apt install -y curl screen && screen -U -d -m -S install bash -c "curl -sSL https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/premi.sh -o premi.sh && chmod +x premi.sh && ./premi.sh" && screen -r install
```

**Jika koneksi / SSH Anda terputus di tengah jalan:**
Login kembali ke VPS Anda via SSH, lalu ketik perintah berikut untuk memantau proses instalasi kembali:
```bash
screen -r install
```

---

### 🌐 SETTING DOMAIN SETELAH INSTALL SELESAI
Instalasi berjalan 100% otomatis menggunakan **Domain Sementara** (tidak akan berhenti meminta input domain).

Setelah instalasi selesai, ganti ke domain asli Anda kapan saja dengan mengetik:
```bash
addhost
```
*(Atau ketik `menu` lalu pilih menu pengaturan).*

---

### 🔄 UPDATE SCRIPT & MENU
```bash
curl -sSL https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/update.sh -o update.sh && chmod +x update.sh && ./update.sh
```

---

### 📞 KONTAK & IZIN SCRIPT
Contact Admin ©GEN SSH STORE:
https://wa.me/6285712349668

---

### 💻 TESTED ON OS
- Ubuntu 20.04 LTS
- Ubuntu 22.04 LTS
- Debian 10 / 11 / 12

### 🚀 FITUR SCRIPT
- Pemasangan otomatis tanpa berhenti (Auto Temporary Domain)
- Format SSH langsung jadi (`domain:port@user:pass`)
- Core Xray resmi (direct release installer)
- Fail2ban auto active (anti brute-force)
- Auto Swap 1GB
- Tuning network sysctl (TCP BBR)
- Auto clear log per 3 menit
- Auto delete user expired
- User details akun & Telegram bot support

### 🔌 PORT INFORMATION
```
- TROJAN WS           : 443
- TROJAN GRPC         : 443
- SHADOWSOCKS WS      : 443
- SHADOWSOCKS GRPC    : 443
- VLESS WS            : 443
- VLESS GRPC          : 443
- VLESS NONTLS        : 80
- VMESS WS            : 443
- VMESS GRPC          : 443
- VMESS NONTLS        : 80
- SSH WS / TLS        : 443
- SSH NON TLS         : 80 / 8880
- OVPN SSL / TCP      : 1194
- SLOWDNS             : 5300
```

### ⚙️ SETTING CLOUDFLARE
```
- SSL/TLS            : FULL / STRICT
- SSL/TLS Recommender: OFF
- GRPC               : ON
- WEBSOCKET          : ON
- Always Use HTTPS   : OFF
- UNDER ATTACK MODE  : OFF
```
