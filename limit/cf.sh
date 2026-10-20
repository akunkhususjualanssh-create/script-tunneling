#!/bin/bash
# Cloudflare Pointing Helper - GEN SSH STORE
mkdir -p /root /etc/xray /var/lib/kyt
MYIP=$(curl -sS ipv4.icanhazip.com || wget -qO- icanhazip.com)

clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       CLOUDFLARE DNS SETUP       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Masukkan Subdomain yang sudah Anda pointing"
echo -e "ke IP Server: \033[1;32m$MYIP\033[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Subdomain: " dns

while [[ -z "$dns" ]]; do
    echo -e "\033[1;31mSubdomain tidak boleh kosong!\033[0m"
    read -p "Subdomain: " dns
done

echo "$dns" > /root/domain
echo "$dns" > /root/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
echo "$dns" > /etc/xray/scdomain
echo "IP=$dns" > /var/lib/kyt/ipvps.conf

echo -e "\033[1;32mDomain $dns berhasil disimpan!\033[0m"
sleep 2
