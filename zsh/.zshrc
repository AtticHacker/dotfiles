# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Zsh Theme
ZSH_THEME="kevin"

# Needed if the system thinks JAVA_HOME is java-7
JAVA_HOME='/usr/lib/jvm/java-6-openjdk'

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Shortcut for xmonad.hs
XMO=$HOME/.xmonad/xmonad.hs

# Swap Ctrl and Alt
alias swapca="xmodmap $HOME/.xmodmaprc"

# Clear
alias c='clear'

# Copy a new Jruby app
alias newjruby='cp -R .jruby-game'

# Execute ruby program without dependency error
alias runjruby='ruby -J-Djava.library.path=.'

# Start Tiled Map Editor
alias tiled='~/.tiled/bin/tiled'

# Scan for bluetooth devices
alias sblue='hcitool scan'

# Connect to my Meenee Mouse
alias cmouse='sudo hidd -i hci0 --connect 20:11:11:02:4c:10'

# Connect to my Apple Mouse
alias cmmouse='sudo hidd -i hci0 --connect C4:2C:03:B8:A4:57'

# Start Photoshop
alias photoshop='wine ~/.wine/PS/PhotoshopPortable'

# Reset database and seed
alias reseed='rake db:migrate:reset && rake db:seed'

# Shutdown
alias shutdown='sudo shutdown -h now'

# Reboot
alias reboot='sudo reboot'

# Connect to my iPhone using MyWi
alias cphone='/lib/udev/ipheth-pair && sudo dhcpcd eth1'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
