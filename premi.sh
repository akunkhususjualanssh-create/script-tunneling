#!/bin/bash
### Color
export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFOLD=1
export NEEDRESTART_MODE=a
export NEEDRESTART_SUSPEND=1

# Force IPv4 to prevent hanging on misconfigured IPv6 cloud VPS
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1 || true
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1 || true
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6 2>/dev/null || true

# Disable needrestart prompts if present (Debian 12 & Ubuntu 22.04+)
if [ -d /etc/needrestart/conf.d ]; then
    echo '$nrconf{restart} = "a";' > /etc/needrestart/conf.d/50-autorestart.conf 2>/dev/null || true
fi

# Otomatis lewati pertanyaan konflik file config (haproxy.cfg, dropbear, dll) & paksa IPv4
mkdir -p /etc/apt/apt.conf.d
cat << 'EOFAPT' > /etc/apt/apt.conf.d/99force-conf
Dpkg::Options {
   "--force-confdef";
   "--force-confold";
};
Acquire::ForceIPv4 "true";
EOFAPT

# Universal robust download helper with IPv4 forced & strict timeouts
download_file() {
    local target="$1"
    local url="$2"
    mkdir -p "$(dirname "$target")" 2>/dev/null || true
    curl -4 -sS -L --connect-timeout 8 --max-time 30 -o "$target" "$url" 2>/dev/null || \
    wget -4 -q --timeout=10 --tries=2 -O "$target" "$url" 2>/dev/null || true
}

apt update -y >/dev/null 2>&1
apt install -y lolcat wondershaper curl wget sudo >/dev/null 2>&1 || true
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
EROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
TIME=$(date '+%d %b %Y')
ipsaya=$(curl -sS ipv4.icanhazip.com)
TIMES="10"
CHATID="5289385265"
KEY="6525206851:AAEK0Wcrr86LiFOe8M0E4Vn9xH0qIPN8rqE"
URL="https://core.telegram.org/bots/api"
# ===================
clear
  # // Exporint IP AddressInformation
export IP=$( curl -sS icanhazip.com )
NET=$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1)
[[ -z "$NET" ]] && NET="eth0"

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

  # // Banner
echo -e "\033[1;36m╭─────────────────────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;36m│\033[0m        \033[1;37m⚡ GEN SSH STORE PREMIUM AUTOSCRIPT VIP ⚡\033[0m           \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m           \033[1;33mHigh Performance Multi-Protocol Server\033[0m            \033[1;36m│\033[0m"
echo -e "\033[1;36m├─────────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;36m│\033[0m \033[1;34m• Supported OS\033[0m : \033[1;37mUbuntu 20.04 / 22.04 LTS & Debian 10/11/12\033[0m   \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m \033[1;34m• Architecture\033[0m : \033[1;37mx86_64 (64-Bit AMD / Intel)\033[0m                  \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m \033[1;34m• Protocols\033[0m    : \033[1;37mSSH • VMess • VLess • Trojan • Shadowsocks\033[0m \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m \033[1;34m• Features\033[0m     : \033[1;37mMulti-Port • Auto-SSL • Telegram Bot Panel\033[0m \033[1;36m│\033[0m"
echo -e "\033[1;36m╰─────────────────────────────────────────────────────────────╯\033[0m"
echo ""
sleep 1
###### IZIN SC 

# // Checking Os Architecture
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi

# // Checking System
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
    echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
    exit 1
fi

# // IP Address Validating
if [[ $IP == "" ]]; then
    echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${green}$IP${NC} )"
fi

# // Validate Successfull
echo ""
read -t 3 -p "$( echo -e "Press ${GRAY}[ ${NC}${green}Enter${NC} ${GRAY}]${NC} For Starting Installation (Otomatis jalan 3 detik)...") " || true
echo ""
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m" 
clear
# Version sc
clear
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl -s https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/izinv2 | grep $MYIP | awk '{print $2}')
[[ -z "$username" ]] && username="GEN SSH STORE"
echo "$username" >/usr/bin/user
expx=$(curl -s https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/izinv2 | grep $MYIP | awk '{print $3}')
[[ -z "$expx" ]] && expx="Lifetime"
echo "$expx" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
echo "2.0" > /usr/bin/ver
oid=$(cat /usr/bin/ver 2>/dev/null || echo "2.0")
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
today=$(date +"%Y-%m-%d")
d2=$(date -d "$today" +%s)
if [[ "$exp" == *"Lifetime"* ]] || [[ -z "$exp" ]]; then
    certifacate="∞"
else
    d1=$(date -d "$exp" +%s 2>/dev/null || echo "$d2")
    certifacate=$(((d1 - d2) / 86400))
fi
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
if [[ "$exp" != *"Lifetime"* ]] && [[ -n "$exp" ]] && [[ "$today" > "$exp" ]]; then
sts="${Error}"
else
sts="${Info}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# REPO    
    REPO="https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/"

####
start=$(date +%s)
secs_to_human() {
    echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
### Status
function print_ok() {
    echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
    echo -e "\033[1;36m╭─────────────────────────────────────────────────────────────╮\033[0m"
    printf "\033[1;36m│\033[0m  \033[1;33m⏳ MEMASANG\033[0m : %-45s \033[1;36m│\033[0m\n" "$1"
    echo -e "\033[1;36m╰─────────────────────────────────────────────────────────────╯\033[0m"
    sleep 0.5
}

function print_error() {
    echo -e "\033[1;31m╭─────────────────────────────────────────────────────────────╮\033[0m"
    printf "\033[1;31m│\033[0m  \033[1;41;37m ERROR \033[0m : %-47s \033[1;31m│\033[0m\n" "$1"
    echo -e "\033[1;31m╰─────────────────────────────────────────────────────────────╯\033[0m"
}

function print_success() {
    echo -e "\033[1;36m╭─────────────────────────────────────────────────────────────╮\033[0m"
    printf "\033[1;36m│\033[0m  \033[1;32m✓ BERHASIL\033[0m  : %-45s \033[1;36m│\033[0m\n" "$1"
    echo -e "\033[1;36m╰─────────────────────────────────────────────────────────────╯\033[0m"
    sleep 0.5
}

### Cek root
function is_root() {
    if [[ 0 == "$UID" ]]; then
        print_ok "Root user Start installation process"
    else
        print_error "The current user is not the root user, please switch to the root user and run the script again"
    fi

}

# Buat direktori xray
print_install "Membuat direktori xray"
    mkdir -p /etc/xray
    curl -s ifconfig.me > /etc/xray/ipvps
    touch /etc/xray/domain
    mkdir -p /var/log/xray
    chown -R www-data:www-data /var/log/xray
    chmod +x /var/log/xray
    touch /var/log/xray/access.log
    touch /var/log/xray/error.log
    mkdir -p /var/lib/kyt >/dev/null 2>&1
    # // Ram Information
    while IFS=":" read -r a b; do
    case $a in
        "MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
        "Shmem") ((mem_used+=${b/kB}))  ;;
        "MemFree" | "Buffers" | "Cached" | "SReclaimable")
        mem_used="$((mem_used-=${b/kB}))"
    ;;
    esac
    done < /proc/meminfo
    Ram_Usage="$((mem_used / 1024))"
    Ram_Total="$((mem_total / 1024))"
    export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
    export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
    export Kernel=$( uname -r )
    export Arch=$( uname -m )
    export IP=$( curl -s https://ipinfo.io/ip/ )

# Change Environment System
function first_setup(){
    timedatectl set-timezone Asia/Jakarta 2>/dev/null || true
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

    # Pasang Swap 1GB di awal agar RAM tidak beku/OOM saat install paket berat di Debian/Ubuntu 1GB RAM
    if [ ! -f /swapfile ]; then
        dd if=/dev/zero of=/swapfile bs=1024 count=1048576 >/dev/null 2>&1
        mkswap /swapfile >/dev/null 2>&1
        chown root:root /swapfile 2>/dev/null
        chmod 0600 /swapfile >/dev/null 2>&1
        swapon /swapfile >/dev/null 2>&1
        sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab 2>/dev/null
    fi

    print_success "Directory Xray & Swap"
    print_install "Setup Dependencies (HAProxy)..."
    apt update -y >/dev/null 2>&1
    DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" haproxy
}
# GEO PROJECT
clear
function nginx_install() {
    # // Checking System
    if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
        print_install "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
        DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" nginx
    elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
        print_success "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
        DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" nginx
    else
        echo -e " Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
    fi
}

# Update and remove packages
function base_package() {
    print_install "Menginstall Paket Sistem & Dependensi..."
    echo -e "\033[1;33m[INFO] Sedang mengunduh paket pendukung (3-5 menit, mohon ditunggu)...\033[0m"
    
    DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" zip unzip pwgen openssl netcat-openbsd socat cron bash-completion lsof psmisc figlet sudo debconf-utils >/dev/null 2>&1
    
    apt-get remove --purge exim4 ufw firewalld -y >/dev/null 2>&1 || true
    
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

    # Install semua paket yang dibutuhkan secara non-interaktif (Aman di Debian 10/11/12 & Ubuntu 20.04/22.04/24.04)
    DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        speedtest-cli vnstat pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils \
        flex bison make libevent-dev bc rsyslog dos2unix zlib1g-dev libssl-dev libsqlite3-dev \
        sed dirmngr build-essential gcc g++ python3 python3-pip python-is-python3 htop lsof \
        tar wget curl ruby p7zip-full libc6 util-linux msmtp-mta ca-certificates bsd-mailx \
        iptables iptables-persistent netfilter-persistent net-tools \
        gnupg gnupg2 lsb-release shc cmake git screen socat xz-utils apt-transport-https dnsutils \
        cron bash-completion chrony jq openvpn easy-rsa >/dev/null 2>&1 || true
    DEBIAN_FRONTEND=noninteractive apt-get install -y libnss3-dev libnspr4-dev libnss3-tools libcurl4-openssl-dev libselinux1-dev libxml-parser-perl

    # Sinkronisasi waktu non-blocking
    systemctl enable chrony >/dev/null 2>&1 || true
    systemctl restart chrony >/dev/null 2>&1 || true
    timeout 5 chronyc tracking -v >/dev/null 2>&1 || true

    print_success "Paket Yang Dibutuhkan Berhasil Terpasang"
}
clear
# Fungsi input domain (Domain Sementara Otomatis Tanpa Berhenti)
function pasang_domain() {
    clear
    print_install "Menyiapkan Domain Sementara (Auto-Install Tanpa Berhenti)"
    MYIP=$(curl -sS ipv4.icanhazip.com || curl -sS ifconfig.me || wget -qO- icanhazip.com || echo "127.0.0.1")
    TEMP_SUB=$(echo "$MYIP" | tr '.' '-')
    domain_temp="${TEMP_SUB}.sslip.io"

    mkdir -p /etc/xray /var/lib/kyt /root
    echo "$domain_temp" > /etc/xray/domain
    echo "$domain_temp" > /root/domain
    echo "$domain_temp" > /root/scdomain
    echo "IP=$domain_temp" > /var/lib/kyt/ipvps.conf
    
    print_success "Domain Sementara: $domain_temp"
}

clear
#GANTI PASSWORD DEFAULT
function password_default() {
    echo -e "${green}Konfigurasi default password...${NC}"
}
restart_system() {
    echo -e "${green}Persiapan restart sistem dan apply semua layanan...${NC}"
}
clear
# Pasang SSL
function pasang_ssl() {
clear
print_install "Memasang SSL Pada Domain"
    rm -rf /etc/xray/xray.key /etc/xray/xray.crt /etc/haproxy/hap.pem
    domain=$(cat /root/domain 2>/dev/null || cat /etc/xray/domain 2>/dev/null || echo "gensshstore.com")
    systemctl stop nginx haproxy ws 2>/dev/null
    fuser -k 80/tcp 443/tcp 2>/dev/null
    mkdir -p /root/.acme.sh /etc/xray /etc/haproxy
    curl -s https://get.acme.sh | sh -s email=admin@$domain >/dev/null 2>&1
    /root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
    /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
    /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 --force >/dev/null 2>&1
    /root/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc >/dev/null 2>&1
    if [[ ! -s /etc/xray/xray.crt || ! -s /etc/xray/xray.key ]]; then
        echo -e "${YELLOW}[WARN] Let's Encrypt gagal, membuat SSL Self-Signed otomatis...${NC}"
        openssl req -new -newkey rsa:2048 -days 365 -nodes -x509             -subj "/C=ID/ST=Jakarta/L=Jakarta/O=GEN SSH STORE/OU=IT/CN=${domain}"             -keyout /etc/xray/xray.key -out /etc/xray/xray.crt >/dev/null 2>&1
    fi
    chmod 644 /etc/xray/xray.crt 2>/dev/null
    chmod 600 /etc/xray/xray.key 2>/dev/null
    cat /etc/xray/xray.crt /etc/xray/xray.key > /etc/haproxy/hap.pem 2>/dev/null
    print_success "SSL Certificate"
}

function make_folder_xray() {
rm -rf /etc/vmess/.vmess.db
    rm -rf /etc/vless/.vless.db
    rm -rf /etc/trojan/.trojan.db
    rm -rf /etc/shadowsocks/.shadowsocks.db
    rm -rf /etc/ssh/.ssh.db
    rm -rf /etc/bot/.bot.db
    mkdir -p /etc/bot
    mkdir -p /etc/xray
    mkdir -p /etc/vmess
    mkdir -p /etc/vless
    mkdir -p /etc/trojan
    mkdir -p /etc/shadowsocks
    mkdir -p /etc/ssh
    mkdir -p /usr/bin/xray/
    mkdir -p /var/log/xray/
    mkdir -p /var/www/html
    mkdir -p /etc/kyt/limit/vmess/ip
    mkdir -p /etc/kyt/limit/vless/ip
    mkdir -p /etc/kyt/limit/trojan/ip
    mkdir -p /etc/kyt/limit/ssh/ip
    mkdir -p /etc/limit/vmess
    mkdir -p /etc/limit/vless
    mkdir -p /etc/limit/trojan
    mkdir -p /etc/limit/ssh
    chmod +x /var/log/xray
    touch /etc/xray/domain
    touch /var/log/xray/access.log
    touch /var/log/xray/error.log
    touch /etc/vmess/.vmess.db
    touch /etc/vless/.vless.db
    touch /etc/trojan/.trojan.db
    touch /etc/shadowsocks/.shadowsocks.db
    touch /etc/ssh/.ssh.db
    touch /etc/bot/.bot.db
    echo "& plughin Account" >>/etc/vmess/.vmess.db
    echo "& plughin Account" >>/etc/vless/.vless.db
    echo "& plughin Account" >>/etc/trojan/.trojan.db
    echo "& plughin Account" >>/etc/shadowsocks/.shadowsocks.db
    echo "& plughin Account" >>/etc/ssh/.ssh.db
    }
#Instal Xray
function install_xray() {
clear
    print_install "Core Xray 1.8.1 Latest Version"
    # install xray
    #echo -e "[ ${green}INFO$NC ] Downloading & Installing xray core"
    domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
    chown -R www-data:www-data "$domainSock_dir"
    
    # / / Ambil Xray Core Version Terbaru
    # / / Pasang Xray Core Resmi (Direct Release Zip)
    mkdir -p /usr/local/bin /usr/local/share/xray /var/log/xray /etc/xray /run/xray
    echo -e "\033[1;33m[INFO] Mengunduh binary Core Xray (~15 MB)...\033[0m"
    curl -# -L --connect-timeout 15 --retry 3 -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip" || curl -sL --connect-timeout 15 -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/v1.8.24/Xray-linux-64.zip" || wget --timeout=30 -q -O /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip"
    echo ""
    echo -e "\033[1;32m[INFO] Mengekstrak Core Xray & Konfigurasi...\033[0m"
    unzip -o /tmp/xray.zip -d /tmp/xray-bin >/dev/null 2>&1
    mv /tmp/xray-bin/xray /usr/local/bin/xray
    chmod +x /usr/local/bin/xray
    mv /tmp/xray-bin/*.dat /usr/local/share/xray/ 2>/dev/null
    rm -rf /tmp/xray.zip /tmp/xray-bin
    chown -R www-data:www-data /var/log/xray /etc/xray /run/xray
    chmod -R 775 /var/log/xray
    download_file "/etc/xray/config.json" "${REPO}limit/config.json"
    download_file "/etc/systemd/system/runn.service" "${REPO}limit/runn.service"
    domain=$(cat /etc/xray/domain 2>/dev/null || echo "gensshstore.com")
    IPVS=$(cat /etc/xray/ipvps 2>/dev/null || echo "$IP")
    print_success "Core Xray 1.8.1 Latest Version"
    
    # Settings UP Nginix Server
    clear
    curl -4 -s --connect-timeout 5 -m 8 ipinfo.io/city >>/etc/xray/city 2>/dev/null || echo "Unknown" >>/etc/xray/city
    curl -4 -s --connect-timeout 5 -m 8 ipinfo.io/org 2>/dev/null | cut -d " " -f 2-10 >>/etc/xray/isp || echo "Unknown" >>/etc/xray/isp
    print_install "Memasang Konfigurasi Packet"
    mkdir -p /etc/haproxy /etc/nginx/conf.d /etc/xray
    download_file "/etc/haproxy/haproxy.cfg" "${REPO}limit/haproxy.cfg"
    download_file "/etc/nginx/conf.d/xray.conf" "${REPO}limit/xray.conf"
    download_file "/etc/nginx/nginx.conf" "${REPO}limit/nginx.conf"
    sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg 2>/dev/null || true
    sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf 2>/dev/null || true
    
    if [[ -f /etc/xray/xray.crt && -f /etc/xray/xray.key ]]; then
        cat /etc/xray/xray.crt /etc/xray/xray.key > /etc/haproxy/hap.pem 2>/dev/null || true
    fi
    chown -R www-data:www-data /var/log/xray /etc/xray /run/xray 2>/dev/null || true
    chmod -R 775 /var/log/xray 2>/dev/null || true

    # > Set Permission
    chmod +x /etc/systemd/system/runn.service 2>/dev/null || true

    # > Create Service
    rm -rf /etc/systemd/system/xray.service.d
    cat >/etc/systemd/system/xray.service <<EOF
[Unit]
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target

[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target

EOF
print_success "Konfigurasi Packet"
}

function ssh(){
clear
print_install "Memasang Password SSH"
    download_file "/etc/pam.d/common-password" "${REPO}limit/password"
    chmod +x /etc/pam.d/common-password 2>/dev/null || true
    systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || /etc/init.d/ssh restart 2>/dev/null || true

    #DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration >/dev/null 2>&1 || true
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
print_success "Password SSH"
}

function udp_mini(){
clear
print_install "Memasang Service Limit Quota"
download_file "/root/limit.sh" "${REPO}limit/limit.sh" && chmod +x /root/limit.sh && /root/limit.sh >/dev/null 2>&1 || true

cd
download_file "/usr/bin/limit-ip" "${REPO}limit/limit-ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit-ip
cd
clear
#SERVICE LIMIT ALL IP
cat >/etc/systemd/system/vmip.service << EOF
[Unit]
Description=My
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vmip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vmip
systemctl enable vmip

cat >/etc/systemd/system/vlip.service << EOF
[Unit]
Description=My
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vlip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vlip
systemctl enable vlip

cat >/etc/systemd/system/trip.service << EOF
[Unit]
Description=My
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip trip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart trip
systemctl enable trip
#SERVICE LIMIT QUOTA

#SERVICE VMESS
# // Installing UDP Mini
mkdir -p /usr/local/kyt/
download_file "/usr/local/kyt/udp-mini" "${REPO}limit/udp-mini"
chmod +x /usr/local/kyt/udp-mini
download_file "/etc/systemd/system/udp-mini-1.service" "${REPO}limit/udp-mini-1.service"
download_file "/etc/systemd/system/udp-mini-2.service" "${REPO}limit/udp-mini-2.service"
download_file "/etc/systemd/system/udp-mini-3.service" "${REPO}limit/udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
print_success "Limit Quota Service"
}

function ssh_slow(){
clear
# // Installing UDP Mini
print_install "Memasang modul SlowDNS Server"
    download_file "/tmp/nameserver" "${REPO}limit/nameserver"
    chmod +x /tmp/nameserver 2>/dev/null || true
    bash /tmp/nameserver >/dev/null 2>&1 || true
 print_success "SlowDNS"
}

clear
function ins_SSHD(){
clear
print_install "Memasang SSHD"
    download_file "/etc/ssh/sshd_config" "${REPO}limit/sshd"
    chmod 644 /etc/ssh/sshd_config 2>/dev/null || true
    systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || /etc/init.d/ssh restart 2>/dev/null || true
print_success "SSHD"
}

clear
function ins_dropbear(){
clear
print_install "Menginstall Dropbear"
    DEBIAN_FRONTEND=noninteractive apt-get install -y dropbear >/dev/null 2>&1 || true
    download_file "/etc/default/dropbear" "${REPO}limit/dropbear.conf"
    chmod 644 /etc/default/dropbear 2>/dev/null || true
    systemctl restart dropbear 2>/dev/null || /etc/init.d/dropbear restart 2>/dev/null || true
print_success "Dropbear"
}

clear
function ins_vnstat(){
clear
print_install "Menginstall Vnstat"
# setting vnstat
apt -y install vnstat > /dev/null 2>&1
systemctl stop vnstat >/dev/null 2>&1 || true
vnstat -u -i $NET 2>/dev/null || true
sed -i "s/Interface \"eth0\"/Interface \"$NET\"/g" /etc/vnstat.conf 2>/dev/null || true
chown vnstat:vnstat /var/lib/vnstat -R 2>/dev/null || true
systemctl enable vnstat >/dev/null 2>&1
systemctl restart vnstat >/dev/null 2>&1 || /etc/init.d/vnstat restart >/dev/null 2>&1
print_success "Vnstat"
}

function ins_openvpn(){
clear
print_install "Menginstall OpenVPN"
    download_file "/root/openvpn" "${REPO}limit/openvpn"
    chmod +x /root/openvpn 2>/dev/null || true
    /root/openvpn >/dev/null 2>&1 || true
    systemctl restart openvpn 2>/dev/null || /etc/init.d/openvpn restart 2>/dev/null || true
print_success "OpenVPN"
}

function ins_backup(){
clear
print_install "Memasang Backup Server"
#BackupOption
apt install rclone -y
printf "q\n" | rclone config
mkdir -p /root/.config/rclone
    download_file "/root/.config/rclone/rclone.conf" "${REPO}limit/rclone.conf"
#Install Wondershaper
cd /bin
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install 2>/dev/null || true
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
EOF
chown -R www-data:www-data /etc/msmtprc
download_file "/etc/ipserver" "${REPO}limit/ipserver"
    bash /etc/ipserver >/dev/null 2>&1 || true
print_success "Backup Server"
}

clear
function ins_swab(){
clear
print_install "Memasang Swap 1 G & BBR"
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases 2>/dev/null | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
[[ -z "$gotop_latest" ]] && gotop_latest="4.2.0"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb 2>/dev/null
dpkg -i /tmp/gotop.deb >/dev/null 2>&1 || true
rm -f /tmp/gotop.deb

if [ ! -f /swapfile ]; then
    dd if=/dev/zero of=/swapfile bs=1024 count=1048576 >/dev/null 2>&1
    mkswap /swapfile >/dev/null 2>&1
    chown root:root /swapfile 2>/dev/null
    chmod 0600 /swapfile >/dev/null 2>&1
    swapon /swapfile >/dev/null 2>&1
    sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab 2>/dev/null
fi

download_file "/root/bbr.sh" "${REPO}limit/bbr.sh"
    chmod +x /root/bbr.sh 2>/dev/null && /root/bbr.sh >/dev/null 2>&1 || true
    rm -f /root/bbr.sh 2>/dev/null || true
print_success "Swap 1 G & BBR"
}

function ins_Fail2ban(){
clear
print_install "Menginstall Fail2ban"
apt-get install -y fail2ban > /dev/null 2>&1
systemctl enable --now fail2ban >/dev/null 2>&1
systemctl restart fail2ban >/dev/null 2>&1

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi

clear
# banner
echo "Banner /etc/kyt.txt" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/kyt.txt"@g' /etc/default/dropbear

# Ganti Banner
download_file "/etc/kyt.txt" "${REPO}limit/issue.net"
print_success "Fail2ban"
}

function ins_epro(){
clear
print_install "Menginstall ePro WebSocket Proxy"
    download_file "/usr/bin/ws" "${REPO}limit/ws"
    download_file "/usr/bin/tun.conf" "${REPO}limit/tun.conf"
    download_file "/etc/systemd/system/ws.service" "${REPO}limit/ws.service"
    chmod +x /etc/systemd/system/ws.service /usr/bin/ws 2>/dev/null || true
    chmod 644 /usr/bin/tun.conf 2>/dev/null || true
    systemctl daemon-reload 2>/dev/null || true
    systemctl enable --now ws 2>/dev/null || true
    systemctl restart ws 2>/dev/null || true
    mkdir -p /usr/local/share/xray
    download_file "/usr/local/share/xray/geosite.dat" "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
    download_file "/usr/local/share/xray/geoip.dat" "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
    download_file "/usr/sbin/ftvpn" "${REPO}limit/ftvpn"
    chmod +x /usr/sbin/ftvpn 2>/dev/null || true
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# remove unnecessary files
cd
apt autoclean -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
print_success "ePro WebSocket Proxy"
}

function ins_restart(){
clear
print_install "Restarting  All Packet"
    systemctl daemon-reload 2>/dev/null || true
    systemctl restart nginx 2>/dev/null || /etc/init.d/nginx restart 2>/dev/null || true
    systemctl restart openvpn 2>/dev/null || /etc/init.d/openvpn restart 2>/dev/null || true
    systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || /etc/init.d/ssh restart 2>/dev/null || true
    systemctl restart dropbear 2>/dev/null || /etc/init.d/dropbear restart 2>/dev/null || true
    systemctl restart fail2ban 2>/dev/null || /etc/init.d/fail2ban restart 2>/dev/null || true
    systemctl restart vnstat 2>/dev/null || /etc/init.d/vnstat restart 2>/dev/null || true
    systemctl restart haproxy 2>/dev/null || /etc/init.d/haproxy restart 2>/dev/null || true
    systemctl restart cron 2>/dev/null || /etc/init.d/cron restart 2>/dev/null || true
    systemctl enable --now nginx 2>/dev/null || true
    systemctl enable --now xray 2>/dev/null || true
    systemctl enable --now dropbear 2>/dev/null || true
    systemctl enable --now openvpn 2>/dev/null || true
    systemctl enable --now cron 2>/dev/null || true
    systemctl enable --now haproxy 2>/dev/null || true
    systemctl enable --now netfilter-persistent 2>/dev/null || true
    systemctl enable --now ws 2>/dev/null || true
    systemctl enable --now fail2ban 2>/dev/null || true
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/openvpn
rm -f /root/key.pem
rm -f /root/cert.pem
print_success "All Packet"
}

#Instal Menu
function menu(){
    clear
    print_install "Memasang Menu Packet"
    mkdir -p /root/menu-unpack /usr/local/sbin
    download_file "/root/menu.zip" "${REPO}limit/menu.zip"
    unzip -o -q /root/menu.zip -d /root/menu-unpack >/dev/null 2>&1 || true
    if [ -d /root/menu-unpack/menu ]; then
        chmod +x /root/menu-unpack/menu/* 2>/dev/null || true
        mv -f /root/menu-unpack/menu/* /usr/local/sbin/ 2>/dev/null || true
    elif [ -d /root/menu-unpack ]; then
        chmod +x /root/menu-unpack/* 2>/dev/null || true
        mv -f /root/menu-unpack/* /usr/local/sbin/ 2>/dev/null || true
    fi
    rm -rf /root/menu-unpack /root/menu.zip /root/menu 2>/dev/null || true
    print_success "Menu Packet"
}

# Membaut Default Menu 
function profile(){
clear
    cat >/root/.profile <<EOF
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi
mesg n || true
menu
EOF

cat >/etc/cron.d/xp_all <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		2 0 * * * root /usr/local/sbin/xp
	END
	cat >/etc/cron.d/logclean <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		*/20 * * * * root /usr/local/sbin/clearlog
		END
    chmod 644 /root/.profile
	
    cat >/etc/cron.d/daily_reboot <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		0 5 * * * root /sbin/reboot
	END

    echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
    echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >>/etc/cron.d/log.xray
    service cron restart
    cat >/home/daily_reboot <<-END
		5
	END

cat >/etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
EOF

echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
cat >/etc/rc.local <<EOF
#!/bin/sh -e
# rc.local
# By default this script does nothing.
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
systemctl restart netfilter-persistent
exit 0
EOF

    chmod +x /etc/rc.local
    
    AUTOREB=$(cat /home/daily_reboot)
    SETT=11
    if [ $AUTOREB -gt $SETT ]; then
        TIME_DATE="PM"
    else
        TIME_DATE="AM"
    fi
print_success "Menu Packet"
}

# Restart layanan after install
function enable_services(){
clear
print_install "Enable Service"
    systemctl daemon-reload
    systemctl start netfilter-persistent
    systemctl enable --now rc-local
    systemctl enable --now cron
    systemctl enable --now netfilter-persistent
    systemctl restart nginx
    systemctl restart xray
    systemctl restart cron
    systemctl restart haproxy
    print_success "Enable Service"
    clear
}

# Fingsi Install Script
function instal(){
clear
    first_setup
    nginx_install
    base_package
    make_folder_xray
    pasang_domain
    password_default
    pasang_ssl
    install_xray
    ssh
    udp_mini
    ssh_slow
    ins_SSHD
    ins_dropbear
    ins_vnstat
    ins_openvpn
    ins_backup
    ins_swab
    ins_Fail2ban
    ins_epro
    ins_restart
    menu
    profile
    enable_services
    restart_system
}
instal
echo ""
history -c
rm -rf /root/menu
rm -rf /root/*.zip
rm -rf /root/*.sh
rm -rf /root/LICENSE
rm -rf /root/README.md
#rm -rf /root/domain
#sudo hostnamectl set-hostname $user
total_time="$(($(date +%s) - ${start}))"
hostnamectl set-hostname "$username" 2>/dev/null || true
clear
echo -e "\033[1;36m╭─────────────────────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;36m│\033[0m         \033[1;32m🎉 INSTALASI SELESAI DENGAN SUKSES! 🎉\033[0m              \033[1;36m│\033[0m"
echo -e "\033[1;36m├─────────────────────────────────────────────────────────────┤\033[0m"
printf "\033[1;36m│\033[0m \033[1;34m• IP Server\033[0m     : \033[1;37m%-42s\033[0m \033[1;36m│\033[0m\n" "$IP"
printf "\033[1;36m│\033[0m \033[1;34m• Domain Temp\033[0m   : \033[1;33m%-42s\033[0m \033[1;36m│\033[0m\n" "$domain"
printf "\033[1;36m│\033[0m \033[1;34m• Waktu Pasang\033[0m  : \033[1;37m%-42s\033[0m \033[1;36m│\033[0m\n" "$total_time detik"
echo -e "\033[1;36m│\033[0m \033[1;34m• Status Service\033[0m: \033[1;32mSSH • VMess • VLess • Trojan • Nginx • HAP ON\033[0m \033[1;36m│\033[0m"
echo -e "\033[1;36m├─────────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;36m│\033[0m  \033[1;33mINFO PENTING DOMAIN:\033[0m                                       \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m  \033[1;37mSaat ini VPS memakai Domain Sementara ($domain)\033[0m \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m  \033[1;32mGanti ke Domain asli kapan saja dengan ketik: \033[1;93maddhost\033[0m       \033[1;36m│\033[0m"
echo -e "\033[1;36m│\033[0m  \033[1;37mKetik perintah '\033[1;33mmenu\033[1;37m' gasan mambuka control panel VPS\033[0m        \033[1;36m│\033[0m"
echo -e "\033[1;36m╰─────────────────────────────────────────────────────────────╯\033[0m"
echo ""
read -t 10 -p "$( echo -e "Tekan \033[1;33m[ Enter ]\033[0m gasan reboot server (Otomatis reboot 10s)...") " || true
reboot
