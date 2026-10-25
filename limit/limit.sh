#!/bin/bash
REPO="https://raw.githubusercontent.com/akunkhususjualanssh-create/script-tunneling/main/"
mkdir -p /etc/systemd/system /etc/xray

curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/systemd/system/limitvmess.service "${REPO}limit/limitvmess.service" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/systemd/system/limitvmess.service "${REPO}limit/limitvmess.service" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/systemd/system/limitvless.service "${REPO}limit/limitvless.service" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/systemd/system/limitvless.service "${REPO}limit/limitvless.service" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/systemd/system/limittrojan.service "${REPO}limit/limittrojan.service" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/systemd/system/limittrojan.service "${REPO}limit/limittrojan.service" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/systemd/system/limitshadowsocks.service "${REPO}limit/limitshadowsocks.service" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/systemd/system/limitshadowsocks.service "${REPO}limit/limitshadowsocks.service" >/dev/null 2>&1

chmod 644 /etc/systemd/system/limitvmess.service
chmod 644 /etc/systemd/system/limitvless.service
chmod 644 /etc/systemd/system/limittrojan.service
chmod 644 /etc/systemd/system/limitshadowsocks.service

curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/xray/limit.vmess "${REPO}limit/vmess" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/xray/limit.vmess "${REPO}limit/vmess" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/xray/limit.vless "${REPO}limit/vless" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/xray/limit.vless "${REPO}limit/vless" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/xray/limit.trojan "${REPO}limit/trojan" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/xray/limit.trojan "${REPO}limit/trojan" >/dev/null 2>&1
curl -4 -sSL --connect-timeout 8 --max-time 20 -o /etc/xray/limit.shadowsocks "${REPO}limit/shadowsocks" 2>/dev/null || wget -4 -q --timeout=10 --tries=2 -O /etc/xray/limit.shadowsocks "${REPO}limit/shadowsocks" >/dev/null 2>&1

chmod +x /etc/xray/limit.vmess
chmod +x /etc/xray/limit.vless
chmod +x /etc/xray/limit.trojan
chmod +x /etc/xray/limit.shadowsocks

systemctl daemon-reload
systemctl enable --now limitvmess
systemctl enable --now limitvless
systemctl enable --now limittrojan
systemctl enable --now limitshadowsocks
