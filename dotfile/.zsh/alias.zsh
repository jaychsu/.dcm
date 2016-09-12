# Shell
# ======
alias grep='grep --color'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -a -l'
alias rm='rm -v'
alias sudo='sudo -E'
alias vi='vim --noplugin'
alias less='less -r'

if [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -GFh'
  alias o='open'
else
  alias ls='ls --color -hF --show-control-chars'
  alias o='gnome-open'
  alias open='gnome-open'
fi

ce() {
  if [[ $# == 1 ]]; then
    mkdir $1 && cd $1
  else
    echo 'Usage: ce <parent-path>'
  fi
}

# Navigation
# ======
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~ && cd'

# HomeBrew
# ======
alias g='git'
alias gb='gitbook'
alias spg='postgres -D /usr/local/var/postgres'
alias qpg='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

# Node
# ======
alias nd='node'
alias n='npm'
alias nr='npm run'
alias gp='gulp'
alias wp='webpack'
alias ws='webpack-dev-server'

alias nc="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# Ruby
# ======
alias rb='ruby'
alias r='rails'
alias be='bundle exec'
alias rgc='rvm gemset create'
alias rgl='rvm gemset list'
alias rgu='rvm gemset use'

# Third-party
# ======
alias st='/Applications/SourceTree.app/Contents/Resources/stree'

# nvbn/thefuck: https://github.com/nvbn/thefuck
if command_exists thefuck; then
  eval $(thefuck --alias fuck)
fi

sl() {
  SUBLIME='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  SUBLPROJ_DEFAULT_NAME="$1/_index.sublime-project"

  if [[ $# == 1 ]]; then
    if [[ -e $SUBLPROJ_DEFAULT_NAME ]]; then
      eval $SUBLIME $SUBLPROJ_DEFAULT_NAME
    else
      eval $SUBLIME $1
      echo 'Info: Current dev folder has NOT sublime project, you need to create one.'
    fi
  elif [[ $# == 2 ]]; then
    SUBLPROJ_NAME="$1/_$2.sublime-project"
    if [[ -e $SUBLPROJ_NAME ]]; then
      eval $SUBLIME $SUBLPROJ_NAME
    elif [[ -e $SUBLPROJ_DEFAULT_NAME ]]; then
      eval $SUBLIME $SUBLPROJ_DEFAULT_NAME
    else
      eval $SUBLIME $1
      echo 'Info: Current dev folder has NOT sublime project, you need to create one.'
    fi
  else
    echo 'Usage: sl <project-path> [<project-branch>]'
  fi
}

stdev() {
  DEV_IDE='sl'
  GIT_GUI='stree'
  ACTION="open . && ${DEV_IDE} . && ${GIT_GUI} ."

  # `builtin` is required, since `cd` is not a program
  if [[ $# == 1 ]]; then
    builtin cd $1 && eval $ACTION
  else
    echo 'Usage: stdev <project-path>'
  fi
}

# Folder Pathes
# ======
hash -d cloud="$HOME/CloudStation"
hash -d devset="$HOME/CloudStation/DevSets"
hash -d dot="$HOME/.dcm/dotfile"
hash -d down="$HOME/Downloads"
hash -d home="$HOME/.dcm"
hash -d proj="$HOME/CloudStation/Projects"
hash -d site="$HOME/Sites"
hash -d trash="$HOME/.Trash"
