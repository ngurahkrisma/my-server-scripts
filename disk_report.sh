#!/bin/bash
# Update diam-diam tanpa suara sedikitpun
git pull origin main > /dev/null 2>&1

# Tampilkan data System Drive (Baris 1)
df -h / --output=size,used,avail,pcent | grep -v "Size"

# Tampilkan data HDD Storage (Baris 2)
df -h /mnt/Storage1 --output=size,used,avail,pcent | grep -v "Size"
