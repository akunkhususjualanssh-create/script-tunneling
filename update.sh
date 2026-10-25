#!/bin/bash
# =============================================================
#  GEN SSH STORE AUTOSCRIPT TUNNELING - UPDATE SCRIPT
# =============================================================
clear

c_cyan="\033[1;36m"
c_green="\033[1;32m"
c_yellow="\033[1;33m"
c_white="\033[1;37m"
c_nc="\033[0m"

echo -e "${c_cyan}╭─────────────────────────────────────────────────────────────╮${c_nc}"
echo -e "${c_cyan}│${c_nc}             ${c_white}⚡ UPDATE MENU & CONTROL PANEL VPS ⚡${c_nc}            ${c_cyan}│${c_nc}"
echo -e "${c_cyan}├─────────────────────────────────────────────────────────────┤${c_nc}"
echo -e "${c_cyan}│${c_nc}  ${c_yellow}Memproses sinkronisasi menu terbaru matan GitHub...${c_nc}         ${c_cyan}│${c_nc}"
echo -e "${c_cyan}╰─────────────────────────────────────────────────────────────╯${c_nc}"
echo ""

echo -e "  [1/2] ${c_yellow}Mengunduh paket menu terbaru...${c_nc}"
rm -rf /root/menu-unpack /root/menu.zip
curl -4 -# -L --connect-timeout 10 -o /root/menu.zip "https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/menu.zip" || \
wget -4 -q --timeout=15 -O /root/menu.zip "https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/menu.zip"

if [[ ! -s /root/menu.zip ]]; then
    echo -e "  \033[1;31m[ERROR] Gagal mengunduh menu.zip dari GitHub! Periksa koneksi VPS.\033[0m"
    exit 1
fi

echo -e "  [2/2] ${c_yellow}Memasang dan memperbarui perintah menu di /usr/local/sbin...${c_nc}"
mkdir -p /root/menu-unpack /usr/local/sbin
unzip -o -q /root/menu.zip -d /root/menu-unpack >/dev/null 2>&1

if [ -d /root/menu-unpack/menu ]; then
    chmod +x /root/menu-unpack/menu/* 2>/dev/null || true
    mv -f /root/menu-unpack/menu/* /usr/local/sbin/ 2>/dev/null || true
fi
rm -rf /root/menu-unpack /root/menu.zip

echo ""
echo -e "${c_cyan}╭─────────────────────────────────────────────────────────────╮${c_nc}"
echo -e "${c_cyan}│${c_nc}        ${c_green}✓ MENU BERHASIL DI-UPDATE KA VERSI TERBARU!${c_nc}          ${c_cyan}│${c_nc}"
echo -e "${c_cyan}╰─────────────────────────────────────────────────────────────╯${c_nc}"
echo ""
echo -e "  Ketik '\033[1;33mmenu\033[0m' gasan mambuka control panel VPS."
echo ""
