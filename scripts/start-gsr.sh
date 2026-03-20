#!/usr/bin/env bash
sleep 15

GSR_BIN="/run/current-system/sw/bin/gpu-screen-recorder"
PKILL_BIN="/run/current-system/sw/bin/pkill"

$PKILL_BIN -9 -f gpu-screen-recorder
rm -f /tmp/gsr.pid

mkdir -p ~/Videos/Clips

$GSR_BIN -w HDMI-A-1 -f 60 -r 60 -c mp4 -bm cbr -q 20000 \
  -replay-storage disk \
  -a "easyeffects_sink.monitor" \
  -a "easyeffects_source" \
  -o /home/garcia/Videos/Clips > /home/garcia/gsr_boot_debug.log 2>&1 &

GSR_PID=$!
echo $GSR_PID > /tmp/gsr.pid

disown $GSR_PID
