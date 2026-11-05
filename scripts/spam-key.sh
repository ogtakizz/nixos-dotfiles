#!/usr/bin/env bash
PIDFILE=/tmp/spam-key.pid
KEY=18        # código da tecla (18 = E)
DELAY=1     # intervalo entre apertos, em segundos

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill "$(cat "$PIDFILE")"
  rm -f "$PIDFILE"
else
  (
    while true; do
      ydotool key $KEY:1 $KEY:0
      sleep $DELAY
    done
  ) &
  echo $! > "$PIDFILE"
fi
