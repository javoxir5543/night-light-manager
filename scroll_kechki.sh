#!/bin/bash

# Debouncing: agar 0.5 soniya ichida qayta bosilsa, chiqib ket
LOCKFILE="/tmp/scroll_kechki.lock"
if [ -f "$LOCKFILE" ]; then
    exit 0
fi
echo $$ > "$LOCKFILE"
sleep 0.1

MONITOR=$(xrandr | grep " connected" | head -n1 | awk '{print $1}')
FILE="/tmp/kechki_val"
[ ! -f "$FILE" ] && echo "80" > "$FILE"
VAL=$(cat "$FILE")

if [ "$1" == "up" ]; then
    [ $VAL -lt 100 ] && VAL=$((VAL + 10))
elif [ "$1" == "down" ]; then
    [ $VAL -gt 30 ] && VAL=$((VAL - 10))
elif [ "$1" == "restore" ]; then
    :
else
    echo "Ishlatish: $0 {up|down|restore}"
    rm -f "$LOCKFILE"
    exit 1
fi

echo $VAL > "$FILE"
BLUE=$(echo "scale=2; 0.3 + ($VAL * 0.007)" | bc)
GREEN=$(echo "scale=2; 0.6 + ($VAL * 0.004)" | bc)
xrandr --output "$MONITOR" --gamma 1.0:$GREEN:$BLUE
notify-send -h string:x-canonical-private-synchronous:sys-notify "🌙 Kechki rejim" "Hozirgi daraja: $VAL%" -t 1000

rm -f "$LOCKFILE"
