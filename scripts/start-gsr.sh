#!/usr/bin/env bash

# Creates a lockfile so if the script is already running, a second instance just exits immediately 
LOCK="/tmp/gsr-restart.lock"
if [ -f "$LOCK" ]; then
  exit 0
fi 
touch "$LOCK"
trap "rm -rf $LOCK" EXIT

# Ensures the script has all the user's Wayland and Hyprland variables at its disposal
export PATH=/run/wrappers/bin:/run/current-system/sw/bin:$PATH

# Waits 15 seconds after the monitor event fires, giving the system time to fully settle before querying monitors or restarting the recorder
sleep 15

GSR_BIN="/run/current-system/sw/bin/gpu-screen-recorder"
PKILL_BIN="/run/current-system/sw/bin/pkill"

# Force-kills any running gpu-screen-recorder process and cleans up the old PID file.
$PKILL_BIN -9 -f gpu-screen-recorder
rm -f /tmp/gsr.pid

# Make sure the output directory exists
mkdir -p ~/vids/Clips

# Asks Hyprland which monitors are currently active, then picks a recording target in priority order. Uses the laptop monitor as fallback, in case the external (main) monitor is unplugged.
MONITOR=$(hyprctl monitors)

if echo "$MONITOR" | grep -q "HDMI-A-1"; then
  TARGET="HDMI-A-1"
else 
   TARGET="eDP-1"
fi

# Starts the recorder on the chosen monitor, keeping a rolling 60-second replay buffer saved to disk as MP4 with CBR at 20000kbps.
$GSR_BIN -w "$TARGET" -f 60 -r 60 -c mp4 -bm cbr -q 20000 \
  -replay-storage disk \
  -a "easyeffects_sink.monitor" \
  -a "easyeffects_source" \
  -o /home/garcia/vids/Clips &

# Grabs the PID of the just-launched recorder, saves it to /tmp/gsr.pid, and disowns it so it keeps running even if this shell exits.
GSR_PID=$!
echo $GSR_PID > /tmp/gsr.pid
disown $GSR_PID
