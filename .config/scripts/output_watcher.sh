#!bin/sh

LAST=""

while true; do
  if wlr-randr | grep -q "HDMI"; then
    STATE="HDMI"
  else
    STATE="eDP"
  fi

  if [ "$STATE" != "$LAST" ]; then
    ~/.config/scripts/output.sh
    LAST="$STATE"
  fi

  sleep 2
  
done 
