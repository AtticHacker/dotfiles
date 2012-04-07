# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Zsh Theme
ZSH_THEME="kevin"

# Needed if the system thinks JAVA_HOME is java-7
JAVA_HOME='/usr/lib/jvm/java-6-openjdk'

plugins=(git)

source $ZSH/oh-my-zsh.sh


## Aliases

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

# Reset database and seed on Heroku server
alias hereseed='heroku pg:reset SHARED_DATABASE_URL --confirm && heroku run rake db:migrate && heroku run rake db:seed'

# Shutdown
alias shutdown='sudo shutdown -h now'

# Reboot
alias reboot='sudo reboot'

# Connect to my iPhone using MyWi
alias cphone='/lib/udev/ipheth-pair && sudo dhcpcd eth1'

# Compile, run and delete the compiled version of a C file
alias runc='compile_run_destroy'


## Functions

# I compile the C file into an output file and then run it, afterwards I call the
# remove_output_file to remove it. I do this because the file doesn't exist yet when
# running the first function, which is why I'm using 2 functions.
function compile_run_destroy {
  if [ -z "$1" ]
  then
    echo "Please select a C file."
  else
    gcc $1 -o sdiuf8hf83h2gh97dj2037f && ./sdiuf8hf83h2gh97dj2037f ${@:2}
    remove_output_file "78c3r4t67rfg7grf7g27hxr8f27rgfx82rtfb82"
  fi
}

function remove_output_file {
  # The string is used to prevent this function from being
  # called outside of 'compile_run_destroy' / 'alias runc'
  if [[ $1 == "78c3r4t67rfg7grf7g27hxr8f27rgfx82rtfb82" ]]
  then
    if [ -f sdiuf8hf83h2gh97dj2037f ]
    then
      rm sdiuf8hf83h2gh97dj2037f
    fi
  else
    echo "This function can only be run through the alias 'runc'"
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
