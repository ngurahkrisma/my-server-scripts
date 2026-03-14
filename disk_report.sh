#!/bin/bash
# Pindah ke folder script dan tarik update terbaru dari GitHub
cd ~/scripts && git pull origin main > /dev/null 2>&1

# Cek kapasitas System (/) dan Drive HDD (/mnt/Storage1)
# Kita gunakan --output agar formatnya konsisten untuk dibaca n8n
df -h / /mnt/Storage1 --output=size,used,avail,pcent | grep -v "Size"
