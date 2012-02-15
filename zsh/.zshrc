# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

ZSH_THEME="kevin"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Swap Ctrl and Alt
alias swapca="xmodmap $HOME/.xmodmaprc"

XMO=$HOME/.xmonad/xmonad.hs

alias smouse='hcitool scan'
alias cmouse='sudo hidd -i hci0 --connect 20:11:11:02:4c:10'
alias photoshop='wine ~/.wine/PS/PhotoshopPortable'


# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
