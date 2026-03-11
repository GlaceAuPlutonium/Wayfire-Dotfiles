# Wayfire-Dotfiles
My personal Wayfire rice dotfiles. Wayfire is a 3D Wayland compositor.


## **What is this place**
This is a repo I use to keep track of my progress as I improve my system. Feel free to use the dots if you like them :)

I am currently doing all of that on a Void Linux installation running on a 2015 11.6" Lenovo Yoga, with a Celeron N2840, hence the reason I'm trying to keep this light. 

This repository isn't only for the dotfiles, I also keep track of what I have to do on a general level on my system (see TODO.md below).

**The files in this repo are designed for my machine, additionnal tinkering may be required to have something that fits your system.** For example, the EWW sidebar is designed to fit in a 1366x768 screen, it might look too small in a 1080p+ screen.

### Quick access

[README.md](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/README.md)

[TODO.md](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/TODO.md)

[UPDATES.md](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/UPDATES.md)


## Main things (?)
- **Distro** : [Void Linux](https://voidlinux.org/) // Independent lightweight, systemd-free, musl-compatible, stable rolling-release GNU/Linux distribution based on the XBPS package manager.
- **WM** : [Wayfire](https://wayfire.org/) // Wayfire is a 3D Wayland compositor.
- **Bar*** : [Waybar](https://github.com/Alexays/Waybar) // Highly customisable bar for wlroots-based compositors.
- **Sidebar** : [Elkowar's Wacky Widgets](https://github.com/elkowar/eww) // Cool widget system written in Rust that allows you to make your own widgets.
- **Terminal** : [kitty](https://github.com/kovidgoyal/kitty) // Fast, feature-rich, GPU-based terminal.
- **Shell** : [ZSH](https://www.zsh.org/) // Powerful shell. (sorry the official site is ugly af)
- **Launcher** : [Wofi](https://github.com/SimplyCEO/wofi) // Launcher/menu program for wlroots-based Wayland compositors.
- **File Explorer** : [Yazi](https://yazi-rs.github.io/) // Blazing fast, terminal-based file explorer written in Rust.
- **Notifications** : [Mako](https://github.com/emersion/mako) // Lightweight notification daemon for Wayland.
- **Theme** : [TokyoNight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) // Really nice dark theme for GTK apps with overall purple/dark-blue tints.
- **Font** : [Caskaydia Cove](https://www.nerdfonts.com/font-downloads) // A fun, monospaced Nerd Font

*The bar is currently being rewritten using [Quickshell](https://quickshell.org/) which gives me a more flexible bar to work with. Currently about 40% done.


## Showcase

Screenshots will be added later.

<ins> **Videos and GIFs showcases are ruled out.**</ins> The machine I'm currently using doesn't have the necessary power (crappy celeron) to record the screen, unless its like 360p, and there's no point in doing that.


## Install scripts
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

### Inspiration

This project originally started from [blueyt's dotfiles](https://github.com/bluebyt/Wayfire-dots), thanks to him for his amazing work.

I used it as a base to learn ricing and progressively modified it to fit my own workflow and preferences.

### Notes

Some parts of this setup were written with the help of LLMs (GPT/Claude), mostly for small utility scripts, quick problem solving or when I needed help understanding how to implement something.

Although I love the customisation and ricing side of Linux and I'm willing to spend hours tinkering with code, in the end I'm not a developer. I use these tools mostly to help with the more technical parts.

## ⚠️ **Work in progress**
This project is still under active development. Some features and designs are still being developed or refined.  
Feedback and suggestions are welcome !

### 🚧 This page is still being built. 🚧
