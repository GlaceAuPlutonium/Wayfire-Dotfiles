#!/bin/sh

if wlr-randr | grep -q "HDMI"; then
  wlr-randr --output eDP-1 --off
  wlr-randr --output HDMI-1 --on

  sleep 0.3
  eww close sidebar
  sleep 0.3
  eww open sidebar

else
  wlr-randr --output eDP-1 --on
  wlr-randr --output HDMI-1 --off

  sleep 0.3
  eww close sidebar
  sleep 0.3
  eww open sidebar
fi
