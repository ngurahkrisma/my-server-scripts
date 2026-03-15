#!/bin/bash
# 1. Update script diam-diam
git pull origin main > /dev/null 2>&1

# 2. Ambil IP Address
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "IP_ADDR: $SERVER_IP"

# 3. Ambil RAM Usage (dalam MB)
# Menampilkan: Total, Used, Free
free -m | grep "Mem:" | awk '{print "RAM_DATA: "$2" "$3" "$4}'

# 4. Ambil CPU Load (Rata-rata beban kerja 1 menit terakhir)
echo "CPU_LOAD: $(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)"

# 5. Ambil Uptime (Sudah berapa lama server hidup)
echo "UPTIME: $(uptime -p)"

# 6. Ambil Data Storage (seperti kemarin)
df -h / --output=size,used,avail,pcent | grep -v "Size" | awk '{print "DISK_MAIN: "$1" "$2" "$3" "$4}'
df -h /mnt/Storage1 --output=size,used,avail,pcent | grep -v "Size" | awk '{print "DISK_DATA: "$1" "$2" "$3" "$4}'
