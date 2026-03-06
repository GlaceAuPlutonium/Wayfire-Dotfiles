#!/bin/sh

pkgs=$(xbps-query -l | wc -l)
echo "$pkgs"

#[ "$updates" -gt 0 ] && echo "$updates" || echo "A"
