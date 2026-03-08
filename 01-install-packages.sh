#!/usr/bin/env bash

set -e

echo "Updating system and installing packages..."

sudo xbps-install -Su \
git wget curl \
qt6-svg qt6-virtualkeyboard qt6-multimedia qt6-qt5compat qt6-imageformats qt6-declarative \
file nerd-fonts-symbols-ttf 7zip ffmpeg ffmpeg6 jq poppler fd ripgrep fzf zoxide resvg imagemagick wl-clipboard \
bottom eww fastfetch handlr htop kanshi kitty light lite-xl mako micro mpv qalculate-gtk quickshell \
swaylock wlogout wofi waybar yazi imv slurp swappy grim \
asciiquarium cmatrix btrfs-progs bzip2 firefox fuse fuse3 gettext \
lxappearance gtk-engine-murrine gnome-themes-extra font-awesome \
xdg-user-dirs xdg-utils starship pavucontrol swayidle trash-cli \
udiskie udisks2 wev zathura zathura-pdf-mupdf wlr-randr \
network-manager-applet openssh wpa_supplicant wireplumber \
xdg-desktop-portal xdg-desktop-portal-wlr \
usbutils pciutils ntfs-3g papirus-icon-theme noto-fonts-emoji \
sysbench lm_sensors playerctl zsh

echo "Packages installed."

