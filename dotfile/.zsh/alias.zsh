if [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -GFh'
  alias o='open'
else
  alias ls='ls --color -hF --show-control-chars'
  alias o='gnome-open'
  alias open='gnome-open'
fi

# nvbn/thefuck: https://github.com/nvbn/thefuck
if command_exists thefuck; then
  eval $(thefuck --alias fuck)
fi

# Shell
alias grep='grep --color'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -v'
alias sudo='sudo -E'
alias vi='vim --noplugin'
alias less='less -r'

ce() {
  if [[ $# == 1 ]] then
    mkdir $1 && cd $1
  else
    echo 'Warn: Only receive one parameter!'
  fi
}

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~ && cd'

# HomeBrew
alias g='git'
alias gb='gitbook'
alias spg='postgres -D /usr/local/var/postgres'
alias qpg='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

# Node
alias nd='node'
alias n='npm'
alias nr='npm run'
alias gp='gulp'
alias wp='webpack'
alias ws='webpack-dev-server'
alias sscli='( trap "http_proxy off" 2; http_proxy on; DEBUG=proxy kneesocks 10001 1080; )'

# Ruby
alias rb='ruby'
alias r='rails'
alias be='bundle exec'
alias rgc='rvm gemset create'
alias rgl='rvm gemset list'
alias rgu='rvm gemset use'

# Third-party
alias st='stree'

sl() {
  SUBLIME='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  if [[ $# == 1 ]] then
    SUBLPROJ_DEFAULT_NAME="${1}/_index.sublime-project"
    if [[ -e $SUBLPROJ_DEFAULT_NAME ]] then
      eval $SUBLIME $SUBLPROJ_DEFAULT_NAME
    else
      eval $SUBLIME $1
      echo 'Info: Current dev folder has NOT sublime project, you need to create one.'
    fi
  elif [[ $# == 0 ]] then
    eval $SUBLIME .
  else
    echo 'Warn: Only receive one parameter!'
  fi
}

stdev() {
  DEV_IDE='sl'
  GIT_GUI='stree'
  ACTION="open . && ${DEV_IDE} . && ${GIT_GUI} ."

  # `builtin` is required, since `cd` is not a program
  if [[ $# == 1 ]] then
    builtin cd $1 && eval $ACTION
  elif [[ $# == 0 ]] then
    eval $ACTION
  else
    echo 'Warn: Only receive one parameter!'
  fi
}

# Folder Pathes
hash -d cloud="$HOME/CloudStation"
hash -d down="$HOME/Downloads"
hash -d dot="$HOME/.dcm/dotfile"
hash -d site="$HOME/Sites"
