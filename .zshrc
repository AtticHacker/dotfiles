export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH:$HOME/.yarn/bin
alias yarn=yarnpkg

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# GraalVM

function graalvm() {
    export PATH=/opt/graalvm11/bin:$PATH
    export GRAALVM_HOME=/opt/graalvm11
    export JAVA_HOME=/opt/graalvm11
}

 export LC_ALL=en_US.UTF-8

function repl() {
  DEP_INSTAPARSE="instaparse {:mvn/version \"1.4.10\"}"
  DEP_CRITERIUM="criterium {:mvn/version \"0.4.4\"}" 
  DEP_MALLI="malli {:git/url \"https://github.com/metosin/malli\" :sha \"f5a8f0265283c4236a304297e7732efa9fb90ce6\"}"
  DEP_REBEL="com.bhauman/rebel-readline {:mvn/version \"0.1.4\"}"
  DEP_EDAMAME="borkdude/edamame {:mvn/version \"0.0.11-alpha.1\"}"
  DEP_MATRIX="net.mikera/core.matrix {:mvn/version \"0.62.0\"}"
  DEP_HICCUP="hiccup {:mvn/version \"1.0.5\"}"
  DEP_LEIN="leiningen {:mvn/version \"2.9.4\"}"
  DEP_NIPPY="com.taoensso/nippy {:mvn/version \"3.1.1\"}"
  DEP_HASCH="io.replikativ/hasch {:mvn/version \"0.3.7\"}"
  DEPS="$DEP_INSTAPARSE $DEP_CRITERIUM $DEP_MALLI $DEP_REBEL $DEP_EDAMAME $DEP_MATRIX $DEP_HICCUP $DEP_LEIN $DEP_NIPPY $DEP_HASCH"

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

alias change-java='sudo update-alternatives --config javac'

# Move current window to bottom right
# xdotool getactivewindow windowsize 1920 1020 windowmove 1920 1100
unsetopt share_history

# Remap PgUp / PgDown to Left / Right
xmodmap -e "keycode 112 = Left"
xmodmap -e "keycode 117 = Right"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export clojars_user=kwrooijen

# Key repeat
xset r rate 220 40
