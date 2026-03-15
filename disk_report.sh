#!/bin/bash

# 1. Tunggu sampai koneksi internet tersedia (maksimal 30 detik)
# Agar git pull tidak error saat server baru menyala
for i in {1..6}; do
  if ping -c 1 8.8.8.8 &> /dev/null; then
    git pull origin main > /dev/null 2>&1
    break
  fi
  sleep 5
done

# 2. Ambil Alamat IP Local (eth0 atau enp...)
# Perintah ini lebih akurat untuk Ubuntu
SERVER_IP=$(hostname -I | awk '{print $1}')

# 3. Tampilkan IP di baris pertama agar dibaca JavaScript
echo "IP_ADDR: $SERVER_IP"

# 4. Tampilkan data Storage (seperti kemarin)
df -h / --output=size,used,avail,pcent | grep -v "Size"
df -h /mnt/Storage1 --output=size,used,avail,pcent | grep -v "Size"
