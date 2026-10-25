#!/bin/bash
NS=$( cat /etc/xray/dns 2>/dev/null || cat /root/nsdomain 2>/dev/null || echo "" )
PUB=$( cat /etc/slowdns/server.pub 2>/dev/null || echo "" )
domain=$(cat /etc/xray/domain 2>/dev/null || cat /root/domain 2>/dev/null || echo "" )
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y
cd /usr/bin
curl -4 -sSL --connect-timeout 8 --max-time 30 -o /usr/bin/bot.zip https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/bot.zip || wget -4 -q --timeout=10 --tries=2 -O /usr/bin/bot.zip https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/bot.zip
unzip -o -q bot.zip
if [ -d bot ]; then
    mv bot/* /usr/bin/ 2>/dev/null || true
fi
chmod +x /usr/bin/* 2>/dev/null || true
rm -rf bot.zip bot
clear
curl -4 -sSL --connect-timeout 8 --max-time 30 -o /usr/bin/kyt.zip https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/kyt.zip || wget -4 -q --timeout=10 --tries=2 -O /usr/bin/kyt.zip https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/limit/kyt.zip
unzip -o -q kyt.zip
rm -rf kyt.zip
pip3 install -r kyt/requirements.txt --break-system-packages 2>/dev/null || pip3 install -r kyt/requirements.txt

#isi data
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin          : $admin"
echo "Domain        : $domain"
echo "Pub            : $PUB"
echo "Host           : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"
