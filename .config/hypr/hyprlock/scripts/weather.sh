#!/user/bin/env bash

CITY=$(grep -oP '^\s*\$CITY\s*=\s*\K.+' ~/.config/hypr/hyprlock.conf | xargs)
COUNTRY=$(grep -oP '^\s*\$COUNTRY\s*=\s*\K.+' ~/.config/hypr/hyprlock.conf | xargs)

if [[ -z "$CITY" || -z "$COUNTRY" ]]; then
  echo "ERROR: Unable to determine your location"
fi 

weather_info=$(curl -s --fail "https://wttr.in/$CITY?format=%c+%t" 2>/dev/null)

if [[ $? -ne 0 || -z "$weather_info" ]]; then
  echo "ERROR: Failed to retrieve data for $COUNTRY, $CITY"
  exit 1
fi 

echo "$weather_info"
