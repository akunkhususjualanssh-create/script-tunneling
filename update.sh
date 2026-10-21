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

fun_bar() {
    CMD[0]="$1"
    (
        [[ -e $HOME/fim ]] && rm -f $HOME/fim
        ${CMD[0]} >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  ${c_yellow}Mengunduh paket update ${c_white}- ${c_yellow}["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "${c_green}#"
            sleep 0.08s
        done
        [[ -e $HOME/fim ]] && rm -f $HOME/fim && break
        echo -e "${c_yellow}]"
        sleep 0.5s
        tput cuu1
        tput dl1
        echo -ne "  ${c_yellow}Mengunduh paket update ${c_white}- ${c_yellow}["
    done
    echo -e "${c_yellow}]${c_white} - ${c_green}OK !${c_nc}"
    tput cnorm
}

res1() {
    wget -q https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/menu.zip
    unzip -o menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin/
    rm -rf menu menu.zip
}

clear
echo -e "${c_cyan}╭─────────────────────────────────────────────────────────────╮${c_nc}"
echo -e "${c_cyan}│${c_nc}             ${c_white}⚡ UPDATE MENU & CONTROL PANEL VPS ⚡${c_nc}            ${c_cyan}│${c_nc}"
echo -e "${c_cyan}├─────────────────────────────────────────────────────────────┤${c_nc}"
echo -e "${c_cyan}│${c_nc}  ${c_yellow}Memproses sinkronisasi menu terbaru matan GitHub...${c_nc}         ${c_cyan}│${c_nc}"
echo -e "${c_cyan}╰─────────────────────────────────────────────────────────────╯${c_nc}"
echo ""

fun_bar 'res1'

echo ""
echo -e "${c_cyan}╭─────────────────────────────────────────────────────────────╮${c_nc}"
echo -e "${c_cyan}│${c_nc}        ${c_green}✓ MENU BERHASIL DI-UPDATE KA VERSI TERBARU!${c_nc}          ${c_cyan}│${c_nc}"
echo -e "${c_cyan}╰─────────────────────────────────────────────────────────────╯${c_nc}"
echo ""
read -n 1 -s -r -p "Tekan [ Enter ] gasan babulik ka menu"
menu
