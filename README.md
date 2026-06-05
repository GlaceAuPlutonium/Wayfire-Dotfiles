# Wayfire-Dotfiles
My personal Wayfire rice dotfiles. Wayfire is a 3D Wayland compositor.


### **THIS IS A SEPARATE BRANCH FOR MY NIRI SETUP. CHECK MAIN BRANCH FOR WAYFIRE DOTS**

## **What is this place**
This is a repo I use to keep track of my progress as I improve my system. Feel free to use the dots if you like them :)

This Niri setup is currently being run in a Void Linux installation running on a Lenovo ThinkCentre M715q 10VG, with an AMD PRO A10-9700E (and Radeon R7 iGPU).

This repository isn't only for the dotfiles, I also keep track of what I have to do on a general level on my system (see TODO.md below). // need to rewrite

**The files in this repo are designed for my machine, additionnal tinkering may be required to have something that fits your system.**

### Quick access

[README.md](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/README.md)

[TODO.md](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/TODO.md)


## Main components
- **Distro** : [Void Linux](https://voidlinux.org/) // Independent, lightweight, systemd-free, musl-compatible, stable rolling-release GNU/Linux distribution based on the XBPS package manager.
- **WM** : [Niri](https://github.com/niri-wm/niri) // Scrollable-tiling Wayland compositor.
- **Bar** : [Noctalia](https://noctalia.dev/) // A beautiful, minimal desktop shell for Wayland.
- **Terminal** : [kitty](https://github.com/kovidgoyal/kitty) // Fast, feature-rich, GPU-based terminal.
- **Shell** : [ZSH](https://www.zsh.org/) // Powerful shell. (sorry the official site is ugly af)
- **Launcher** : [Wofi](https://github.com/SimplyCEO/wofi) // Launcher/menu program for wlroots-based Wayland compositors.
- **File Explorer** : [Yazi](https://yazi-rs.github.io/) // Blazing fast, terminal-based file explorer written in Rust.
- **Notifications** : [Mako](https://github.com/emersion/mako) // Lightweight notification daemon for Wayland.  -  *Currently unused, using Noctalia's notification system.*
- **Theme** : [TokyoNight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) // Really nice dark theme for GTK apps with overall purple/dark-blue tints.
- **Font** : [Caskaydia Cove](https://www.nerdfonts.com/font-downloads) // A fun, monospaced Nerd Font

## Showcase

Screenshots will be added later.

Unlike the Wayfire setup on my laptop, I can actually record my screen. Video showcases will be added later once I manage do to a proper recording without something going wrong lol

## Install scripts // **need to rewrite this section**
These scripts are optionnal. Don't blindly run all of them, you probably don't need them.  

[01-install-packages.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/01-install-packages.sh) It installs most of the packages used in this setup. Don't run it unless you want a similar/the exact same environment.

[02-install-extras.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/02-install-extras.sh) Run this script if you want to install some extras, which are :  
- Tokyonight GTK Theme (GTK theme)
- MoreWaita Icon Theme (icon theme)
- Phinger Cursors Theme (cursor theme) - *Currently broken it seems*
- SDDM Astronaut Theme in Hyprland_Kath configuration (custom SDDM theme)
- Antidote (for ZSH)
- CyberGRUB-2077 (custom GRUB boot menu)

[03-copy-config.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/03-copy-config.sh) This is what you need if all you care about are the dots. It copies the actual dotfiles and assets :
- .config
- .icons
- .local/share/fonts/CaskaydiaCove
- Wallpapers
- .zshrc and .zsh_plugins.txt

Feel free to modify the scripts if before running them if you only want specific parts.


## Important

### Inspiration // well not so much anymore

This project originally started from [blueyt's dotfiles](https://github.com/bluebyt/Wayfire-dots), thanks to him for his amazing work.

I used it as a base to learn ricing and progressively modified it to fit my own workflow and preferences.

### Notes

Some parts of this setup were written with the help of LLMs (GPT/Claude), mostly for small utility scripts, quick problem solving or when I needed help understanding how to implement something.

Although I love the customisation and ricing side of Linux and I'm willing to spend hours tinkering with code, in the end I'm not a developer. I use these tools mostly to help with the more technical parts.

## ⚠️ **Work in progress**
This project is still under active development. Some features and designs are still being developed or refined.  
<ins>Feedback and suggestions are welcome !</ins>

### 🚧 This page is still being built. 🚧
