VIDEO="$HOME/.local/share/boot-animation.mp4"

mpv \
  --fullscreen \
  --no-border \
  --no-input-default-bindings \
  --ontop \
  --loop=no \
  --keep-open=no \
  --hwdec=auto \
  "$VIDEO" $

MPV_PID=$!
