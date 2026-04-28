#!/usr/bin/env bash
sleep 15

GSR_BIN="/run/current-system/sw/bin/gpu-screen-recorder"
PKILL_BIN="/run/current-system/sw/bin/pkill"

$PKILL_BIN -9 -f gpu-screen-recorder
rm -f /tmp/gsr.pid

mkdir -p ~/Videos/Clips

MONITOR=$(hyprctl monitors)

if echo "$MONITOR" | grep -q "HDMI-A-1"; then
  TARGET="HDMI-A-1"
elif echo "$MONITOR" | grep -q "eDP-1"; then
  TARGET="eDP-1"
else 
  TARGET="screen"
fi

$GSR_BIN -w "$TARGET" -f 60 -r 60 -c mp4 -bm cbr -q 20000 \
  -replay-storage disk \
  -a "easyeffects_sink.monitor" \
  -a "easyeffects_source" \
  -o /home/garcia/Videos/Clips &

GSR_PID=$!
echo $GSR_PID > /tmp/gsr.pid
disown $GSR_PID
