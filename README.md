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
- Distro : [Void Linux](https://voidlinux.org/) // Independent lightweight, systemd-free, musl-compatible, stable rolling-release GNU/Linux distribution based on the XBPS package manager.
- WM : [Wayfire](https://wayfire.org/) // Wayfire is a 3D Wayland compositor.
- Bar : [Waybar](https://github.com/Alexays/Waybar) // Highly customisable bar for wlroots-based compositors.
- Sidebar : [Elkowar's Wacky Widgets](https://github.com/elkowar/eww) // Cool widget system written in Rust that allows you to make your own widgets.
- Terminal : [kitty](https://github.com/kovidgoyal/kitty) // Fast, feature-rich, GPU-based terminal.
- Shell : [ZSH](https://www.zsh.org/) // Powerful shell. (sorry the official site is ugly af)
- Launcher : [Wofi](https://github.com/SimplyCEO/wofi) // Launcher/menu program for wlroots-based Wayland compositors.
- File Explorer : [Yazi](https://yazi-rs.github.io/) // Blazing fast, terminal-based file explorer written in Rust.
- Notifications : [Mako](https://github.com/emersion/mako) // Lightweight notification daemon for Wayland.
- Theme : [TokyoNight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) // Really nice dark theme for GTK apps with overall purple/dark-blue tints.
- Font : [Caskaydia Code](https://www.nerdfonts.com/font-downloads) // A fun, monospaced Nerd Font






## Important

### Install scripts
Don't blindly run every install scripts, you probably don't need them.  

[01-install-packages.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/01-install-packages.sh) Don't run this one unless you want to install a lot of packages that you may not need.  

[02-install-extras.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/02-install-extras.sh) Run this script if you want to install some extras on your system, which are :  
- Tokyonight GTK Theme (GTK theme)
- MoreWaita Icon Theme (icon theme)
- Phinger Cursors Theme (cursor theme)
- SDDM Astronaut Theme in Hyprland_Kath configuration (custom SDDM theme)
- Antidote (for ZSH)
- CyberGRUB-2077 (custom GRUB boot menu)

[03-copy-config.sh](https://github.com/GlaceAuPlutonium/Wayfire-Dotfiles/blob/main/03-copy-config.sh) This is what you need if all you care about are the dots. In additon to copying .config, it will also copy :
- Wallpapers
- .icons
- .local/share/fonts/CaskaydiaCove
- .zshrc and .zsh_plugins.txt

Feel free to edit the scripts if there are things you don't want to install.

### Showcase

There won't be any example/showcase images until I properly set up a way to take screenshots. Until then, this page will remain a blank and sad wall of text (I mean you can still use the dots if you're curious).

<ins> **Videos and GIFs showcases are ruled out.**</ins> The machine I'm currently using doesn't have the necessary power (crappy celeron) to record the screen, unless its like 360p, and there's no point in doing that.

Lots of elements in this project come from [blueyt's dotfiles](https://github.com/bluebyt/Wayfire-dots), thanks to him for his amazing work.

## 🚧 This page is still being built. 🚧
