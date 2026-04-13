# **THIS IS THE NIRI BRANCH, NOT RELEVANT**

## ⚙️ Here I keep tracks of the update I made to my dotfiles and more generally my system.

04 March 2026
- Created the repo and added the current dotfiles.

06 March 2026
- Added whoosh shortcut to ~/dotfiles for easier access
- Downgraded freetype to 2.14.1_1 due to rendering problem in Lite-XL
- Created symlinks towards ~/dotfiles for easier management
- Installed Quickshell to start replacing Waybar and EWW

08 March 2026
- Started working on Quickshell to replace Waybar
- Added new wallpapers
- Added install scripts

10 March 2026
- Done making CPU, RAM, Temp and Backlight Quickshell modules on the topbar
- Fixed the backlight issue where the wrong percentage value was shown due to hardware using an inverted range of values for screen brightness. Was fixed simply by switching to Quickshell and rewriting the light module with a proper percentage shown 

13 March 2026
- Added hover tooltip in RAM module in Quickshell bar
- Deleted micro and wf-shell in .config due to being not used

17 March 2026
- Quickshell / Added proper tooltip to RAM and Network using `PopupWindow` component
- Quickshell / Added Network module

20 March 2026
- Added Battery module in Quickshell bar
- Changed a few deprecated settings in network, ram and battery PopupWindow
