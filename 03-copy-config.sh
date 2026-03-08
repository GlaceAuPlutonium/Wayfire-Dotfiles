#!/usr/bin/env bash

set -e

echo "Copying dotfiles..."

mkdir -p ~/.local/share/fonts

cp -r .config ~/
cp -r .icons ~/
cp -r Wallpapers ~/
cp -r .local/share/fonts/CascadiaCode ~/.local/share/fonts/

cp .zshrc ~/
cp zsh_plugins.txt ~/

echo "Dotfiles installed."
