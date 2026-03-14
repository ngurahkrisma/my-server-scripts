#!/bin/bash
# 1. Update script diam-diam (semua output dibuang)
git pull origin main > /dev/null 2>&1

# 2. Ambil data storage (Format: Size Used Avail Use%)
# Kita panggil satu per satu agar hasilnya pasti 2 baris bersih
df -h / --output=size,used,avail,pcent | grep -v "Size"
df -h /mnt/Storage1 --output=size,used,avail,pcent | grep -v "Size"
