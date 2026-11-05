#!/usr/bin/env bash
LOG=~/netwatch.log
GW=$(ip route | awk '/default/ {print $3; exit}')
echo "$(date '+%F %T') iniciado (gateway=$GW)" >> "$LOG"
while true; do
  g=ok; ping -c1 -W2 "$GW"   >/dev/null 2>&1 || g=FALHA
  i=ok; ping -c1 -W2 1.1.1.1 >/dev/null 2>&1 || i=FALHA
  d=ok; getent hosts apis.roblox.com >/dev/null 2>&1 || d=FALHA
  r=ok; curl -s -o /dev/null -m 5 https://apis.roblox.com/ || r=FALHA
  [[ $g$i$d$r != okokokok ]] && echo "$(date '+%F %T') gateway=$g internet=$i dns=$d roblox=$r" >> "$LOG"
  sleep 5
done
