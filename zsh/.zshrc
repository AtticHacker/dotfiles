# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

ZSH_THEME="kevin"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Swap Ctrl and Alt
xmodmap $ZSH/custom/.xmodmaprc

XMO=$HOME/.xmonad/xmonad.hs

alias smouse='hcitool scan'
alias cmouse='sudo hidd -i hci0 --connect 20:11:11:02:4c:10'
alias photoshop='wine ~/.wine/PS/PhotoshopPortable'


# Customize to your needs...
export PATH=/home/kevin/.rvm/gems/ruby-1.9.3-p0/bin:/home/kevin/.rvm/gems/ruby-1.9.3-p0@global/bin:/home/kevin/.rvm/rubies/ruby-1.9.3-p0/bin:/home/kevin/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
