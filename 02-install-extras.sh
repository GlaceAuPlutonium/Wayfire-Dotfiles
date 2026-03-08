#!/usr/bin/env bash

set -e

echo "Installing themes and extras..."

WORKDIR=$(mktemp -d)
cd "$WORKDIR"

# TokyoNight GTK Theme
git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme
cd Tokyonight-GTK-Theme/themes
sudo ./install.sh -n TokyoNight -c dark -l --tweaks black
sudo ./install.sh -n TokyoNight -c dark -s compact -l --tweaks black
cd "$WORKDIR"

# MoreWaita Icon Theme
git clone https://github.com/somepaulo/MoreWaita.git
cd MoreWaita
sudo ./install.sh
cd "$WORKDIR"

# Phinger Cursor Theme
wget -cO- https://github.com/phish/phinger-cursors/releases/latest/download/phinger-cursors-variants.tar.bz2 \
| sudo tar xfj - -C /usr/share/icons

# SDDM Astronaut Theme
sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git \
/usr/share/sddm/themes/sddm-astronaut-theme

sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts

sudo cp extras/sddm.conf /etc/sddm.conf
sudo cp extras/env.conf /etc/sddm.conf.d/env.conf

echo -e "[General]\nInputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf

sudo fc-cache -fv

sudo cp extras/hyprland_kath.conf \
/usr/share/sddm/themes/sddm-astronaut-theme/Themes/

sudo sed -i 's|^ConfigFile=.*|ConfigFile=Themes/hyprland_kath.conf|' \
/usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop

# Antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

# CyberGRUB
git clone https://github.com/adnksharp/CyberGRUB-2077
cd CyberGRUB-2077
sudo $SHELL ./install.sh -L samurai
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Extras installed."
