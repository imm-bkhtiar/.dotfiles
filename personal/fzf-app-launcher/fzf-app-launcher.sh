#!/usr/bin/env bash

# 1. LOGIKA LOCKFILE (Cek apakah sudah jalan)
LOCKFILE="$HOME/.cache/app-launcher.lock"

# Jika file lock ada dan prosesnya benar-benar masih aktif, langsung keluar
if [ -f "$LOCKFILE" ] && kill -0 $(cat "$LOCKFILE") 2>/dev/null; then
    exit 1
fi

# Simpan PID (Process ID) ke file lock
echo $$ > "$LOCKFILE"

# Pastikan file lock dihapus saat script ditutup (berhasil atau error)
trap "rm -f $LOCKFILE" EXIT

# 2. LOGIKA LAUNCHER (Pencarian .desktop)
# Mencari di folder sistem dan folder user lokal
selected=$(grep -hE '^Name=|^Exec=' /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop 2>/dev/null | \
    sed 'N;s/\n/|/' | \
    sed 's/Name=//g;s/Exec=//g' | \
    fzf --delimiter='|' --with-nth=1 --reverse --border --prompt="Launch: " | \
    cut -d'|' -f2 | \
    sed 's/%.//g' )
 
printf $selected > $HOME/.cache/app-launcher


# 3. EKSEKUSI APLIKASI
if [ -n "$selected" ]; then
    # setsid memastikan aplikasi tetap jalan meski terminal fzf ditutup
    setsid bash -c "$selected" >/dev/null 2>&1 &
fi
