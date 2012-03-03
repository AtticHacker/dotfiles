# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

ZSH_THEME="kevin"

JAVA_HOME='/usr/lib/jvm/java-6-openjdk'
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Swap Ctrl and Alt
alias swapca="xmodmap $HOME/.xmodmaprc"

XMO=$HOME/.xmonad/xmonad.hs

alias runjruby='ruby -J-Djava.library.path=.'
alias c='clear'
alias smouse='hcitool scan'
alias cmouse='sudo hidd -i hci0 --connect 20:11:11:02:4c:10'
alias cmmouse='sudo hidd -i hci0 --connect C4:2C:03:B8:A4:57'
alias photoshop='wine ~/.wine/PS/PhotoshopPortable'
alias reseed='rake db:migrate:reset && rake db:seed'

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
