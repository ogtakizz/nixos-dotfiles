#!/usr/bin/env bash
sleep 5

pkill -9 gpu-screen-recorder
rm -rf /tmp/gsr.pid

mkdir -p ~/Videos/Clips

gpu-screen-recorder -w HDMI-A-1 -f 60 -r 60 -c mp4 -bm cbr -q 20000 -replay-storage disk -a "easyeffects_sink.monitor" -a "easyeffects_source" --merge-audio -o ~/Videos/Clips &
echo $! > /tmp/gsr.pid
