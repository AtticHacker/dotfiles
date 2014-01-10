# Shortcut for xmonad.hs
XMO=$HOME/.xmonad/xmonad.hs
XMOD=$HOME/.xmodmaprc

# Shortcut for .zsh
ZSH=$HOME/.zsh

# Shortcut for .zshrc
ZSHRC=$HOME/.zshrc

# Zsh Theme
ZSH_THEME="kevin"

export PATH=$PATH:$HOME/.cabal/bin/
source $HOME/.lazyVault/binPaths
export PATH=/usr/local/ghc/7.6.3/bin:$PATH
export PATH=$PATH:$HOME/Shortcuts/

export EDITOR="emacs -nw"

# plugins=(git)

## OH MY ZSH options ##
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh


alias emacs='/usr/bin/emacs -nw'

# Git pull
alias pull='git pull'

# Git push
alias push='git push'

# Shutdown
alias shutdown='sudo /sbin/shutdown -h now'

# Reboot
alias reboot='sudo reboot'

alias bl='asus-screen-brightness'

alias kbl='asus-kbd-backlight'

alias lv='LazyVault'

alias htag='hasktags -e . > TAGS'

alias rcd='recordmydesktop --no-cursor --width 1920 --height 1080 --device iec958:CARD=Microphone,DEV=0'

function ignorefile {
    echo "*#\n.#*\n*~\n.*.swp\nlog/\n" > .gitignore
}
function ignore-ruby {
    cp $HOME/.dotfiles/other/scripts/Ruby.gitignore .gitignore
}
# Kill process
function killit {
  itis1=`ps aux | grep $1 | awk '{print $2}' | head -1`
  itis2=`ps aux | grep $1 | awk '{print $2}' | tail -1`
  kill -9 $itis1
  kill -9 $itis2
}

function ogv2avi {
    ffmpeg -i $1 -vcodec mpeg4 -sameq -acodec libmp3lame $2
}

source /usr/share/chruby/chruby.sh
chruby ruby-2.1
