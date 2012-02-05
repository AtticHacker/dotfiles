# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/zsh/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kevin"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Swap Ctrl and Alt
xmodmap $ZSH/custom/.xmodmaprc

alias smouse='hcitool scan'
alias cmouse='sudo hidd -i hci0 --connect 20:11:11:02:4c:10'
alias photoshop='wine ~/.wine/PS/PhotoshopPortable'


# Customize to your needs...
export PATH=/home/kevin/.rvm/gems/ruby-1.9.3-p0/bin:/home/kevin/.rvm/gems/ruby-1.9.3-p0@global/bin:/home/kevin/.rvm/rubies/ruby-1.9.3-p0/bin:/home/kevin/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
