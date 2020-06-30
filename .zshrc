export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
alias yarn=yarnpkg

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# autoload -U promptinit; promptinit
# prompt pure
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-19.2.1/Contents/Home/bin:"$PATH"

  # Set Spaceship ZSH as a prompt
  # autoload -U promptinit; promptinit
  # prompt spaceship
 export LC_ALL=en_US.UTF-8

function repl() {
  DEP_INSTAPARSE="instaparse {:mvn/version \"1.4.10\"}"
  DEP_CRITERIUM="criterium {:mvn/version \"0.4.4\"}" 
  DEP_MALLI="malli {:git/url \"https://github.com/metosin/malli\" :sha \"3e0d72a9869f475beec19cd4ea6ac6bc5bd0ecc0\"}"
  DEP_REBEL="com.bhauman/rebel-readline {:mvn/version \"0.1.4\"}"
  DEP_EDAMAME="borkdude/edamame {:mvn/version \"0.0.11-alpha.1\"}"
  DEP_MATRIX="net.mikera/core.matrix {:mvn/version \"0.62.0\"}"
  DEP_HICCUP="hiccup {:mvn/version \"1.0.5\"}"
  DEPS="$DEP_INSTAPARSE $DEP_CRITERIUM $DEP_MALLI $DEP_REBEL $DEP_EDAMAME $DEP_MATRIX $DEP_HICCUP"

  clojure -Sdeps "{:deps { $DEPS $@ }}" -m rebel-readline.main
}

function lsport() {
  sudo lsof -PiTCP -sTCP:LISTEN
}
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"


function start-kubernetes() {
  export PROJECT=mediquest-staging-test
  gcloud compute start-iap-tunnel kubernetes-master-proxy-kmk1 8443 \
      --project=$PROJECT \
      --zone=europe-west4-a \
      --local-host-port 127.0.0.1:8443
}

# export https_proxy=localhost:8443
export PATH="/usr/local/sbin:$PATH"

function nvm {
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm
}
alias j=autojump

alias open='xdg-open &>/dev/null'

export PATH=$PATH:/usr/lib/jvm/graalvm-ce-java11-20.1.0/lib/installer/bin:/usr/lib/jvm/graalvm/bin/

alias change-java='sudo update-alternatives --config javac'

# Move current window to bottom right
# xdotool getactivewindow windowsize 1920 1020 windowmove 1920 1100
unsetopt share_history

