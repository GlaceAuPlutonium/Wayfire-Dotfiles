## 🔨 All the things that must be done / bugs that must be fixed. 🔨

📌 Must do :

- Autosave screenshots (automatically, already saves in desktop from swappy)

- Lite-XL usually shitting itself when copying big amounts of text then crashes. Lite-XL choking on itself when rendering lots of text

- Begin work with Quickshell to replace Waybar/EWW
- - Waybar : Network, Volume, Battery, Clock, Wayfire Workspaces. Also Add hover text display function like in Waybar
- - EWW : Haven't started yet

- Emojis not typing in from rofimoji :upside_down_face: Neither with wofi-emoji btw. Tried fcitx5 but adds a crapton of kde dependencies and components so nuh uh

- CAPSLOCK key not working with numbers for some reasons

- Emojis are showing up in Yazi but not Lite-XL

- Clipboard still kinda goofy sometimes wont paste for no fucking reasons

- Yazi plugins, check starship.yazi
- - Check augment-command.yazi
- - Check a clipboard plugin (maybe)
- - Check sudo

- In-depth configuration of ZSH
- In-depth configuration of Antidote and plugins
- In-depth configuration of Starship

- Mako needs in-depth functionnal configuraiton (visual done)


EWW basically perfect, modify if needed (not for so long)
Fastfetch is done, modify if needed
Waybar is done, modify if needed (well no stupid workspaces css aint working)(using python rn) but its a pain in the ass, basically waybar css needs to update when changing workspace, would propably be better of by using a dedicatd shell ie. ags, axshell, quickshell etc. So now I'm settled it'll be quickshell

Lite-XL is (almost) done, modify if needed
Kitty is done (?), modify if needed
Wofi is done, modify if needed
If a program isn't using tokyo-night theme, change it


🎨 Things to check if in the mood or if I have time :

- Look for audio visualiser / music player ie. ncmpcpp with Cava/Xava (where to put it ??). Also check out things like Tauon Music Box, Lollypop or Amberol. But if I do I don't know where tf I'd but it

- A system tray could be useful

- PixDecor but check out blueyt's install process

- Get fucking nuts and do that stupid custom animation on bootup (could be easier with quickshell)
- Check out [this dope stuff](https://github.com/TSM-061/ctOS) and amybe switch to greetd intsead of sddm so i could finally have this cool login animation

- Some way to type emojis (halfway through cuz it's janky for now)

- Slight transparency/graying out on unused apps (see blueyt's setup)

- A sound when a device is plugged in

- Yeah so ags for the bars (top/side), need to install it (please don't be a fucker and use the astal/ags doc, not agsv1 doc). The point of it is to replace Waybar/EWW under a same app (and allow me to have a reactive topbar apperance when changing workspace). And also could allow me to have cool deploying pannels with like xava or idk could be neat. and what if using wf-shell for top bar ?

- Clipboard manager ie. Clipse, annoying af (or just have a clipboard manager I guess)

- Maybe look for a dedicated music player instead of mpv

- PixDecor wants git master (Void repo is 0.10.1, git release is 0.10.1, master git is 0.11)

- NF or NF-Mono ? (font) (for like kitty) NF = big icons, NFM = smol icons

- Volume can get way too high (fyi 26478% volume is indeed too loud)

- Find a better way to manage ~/dotfiles maybe ?

- Check out SwayOSD

- Is av1 decoding currently suported ? or driver missing ?

- Customize bottom (process viewer. its the pretty htop)

- extras install script not working when it comes to Phinger Cursors, see what's going on

- I mean that woudd be nice if i could touchscroll in kitty (it looks like I cant)

- Lite-xl sometimes no icon in taskbar on opening (there is but its undefined app icon)
  sometimes when going to lite-xl it switches back, or typing in lite-xl makes the icon appear

also everything on the getting started page should be setup (if something basic seems not implemented refer to it)
https://github.com/WayfireWM/wayfire/wiki/Tutorial
