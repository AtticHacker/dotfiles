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
export PATH=$PATH:$HOME/Shortcuts/:$HOME/.gem/ruby/2.1.0/bin


export EDITOR="emacs -nw"
export ALTERNATE_EDITOR=""
if ! [ -z "$DISPLAY" ] ;then;
    export TERM="xterm-256color";
fi

export PULSE_LATENCY_MSEC=60

DISABLE_CORRECTION="true"

## OH MY ZSH options ##
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh


alias emacs='/usr/bin/emacs -nw'
alias e='/usr/bin/emacsclient -nw -t'

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

#source /usr/share/chruby/chruby.sh
#chruby ruby-2.1
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear #for background artifacting
fi

export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
