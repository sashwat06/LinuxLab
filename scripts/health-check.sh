
#!/usr/bin/env bash

# LinuxLab - Server Health Check

echo "======================================"
echo "       LINUXLAB SERVER HEALTH"
echo "======================================"

echo
echo "[SYSTEM INFORMATION]"
hostname
uptime -p
date

echo
echo "[CPU USAGE]"
top -bn1 | grep "Cpu(s)" | head -1

echo
echo "[MEMORY USAGE]"
free -h

echo
echo "[DISK USAGE]"
df -h /

echo
echo "[NGINX SERVICE]"
if systemctl is-active --quiet nginx; then
    echo "NGINX: RUNNING"
else
    echo "NGINX: NOT RUNNING"
fi

echo
echo "[CLOUDFLARE TUNNEL]"
if systemctl is-active --quiet linuxlab-tunnel; then
    echo "CLOUDFLARE TUNNEL: RUNNING"
else
    echo "CLOUDFLARE TUNNEL: NOT RUNNING"
fi

echo
echo "[NETWORK CONNECTIVITY]"
if curl -fsSI --max-time 5 http://127.0.0.1/ >/dev/null; then
    echo "LOCAL WEB SERVER: RESPONDING"
else
    echo "LOCAL WEB SERVER: NOT RESPONDING"
fi

echo
echo "======================================"
echo "         HEALTH CHECK COMPLETE"
echo "======================================"
