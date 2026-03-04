# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gap/.zshrc'

eval "$(starship init zsh)"


autoload -Uz compinit
compinit
# End of lines added by compinstall


source ~/.antidote/antidote.zsh
antidote load



alias ff='fastfetch'

alias ffull='fastfetch --config ~/.config/fastfetch/config_full.jsonc'

alias vesktop='~/.local/bin/Vesktop-1.6.3.AppImage'
alias discord='~/.local/bin/Vesktop-1.6.3.AppImage'
