# Shell

  alias sudo='sudo -E'
  alias grep='grep --color'
  alias la='ls -al'
  alias c='clear'
  alias rm='rm -v'
  alias v='vim'
  alias vi='vim --noplugin'
  alias vundle='vim +PluginInstall +qall'

  if [[ $OSTYPE == darwin* ]]; then
    alias ls='ls -GFh'
    alias o='open'
  else
    alias ls='ls --color -hF --show-control-chars'
    alias o='gnome-open'
    alias open='gnome-open'
  fi

  ce() {
    if [[ -d $1 ]]; then
      builtin cd $1
    elif [[ -f $1 ]]; then
      echo "'${1}' has already existed as a file."
    elif [[ ! -e $1 ]] && [[ -n $1 ]]; then
      mkdir -p $1 && builtin cd $1
    else
      echo 'Usage: ce <folder-path>'
    fi
  }

# Navigation

  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
  alias ~='cd ~ && cd'

  hash -d home="$HOME/.dcm"
  hash -d desk="$HOME/Desktop"
  hash -d down="$HOME/Downloads"
  hash -d site="$HOME/Sites"
  hash -d trash="$HOME/.Trash"

  hash -d cloud="$HOME/CloudStation"
  hash -d icloud="$HOME/Library/Mobile Documents"
  hash -d drive="$HOME/Google Drive"

  hash -d devset="$HOME/Google Drive/DevSets"
  hash -d dot="$HOME/.dcm/dotfile"
  hash -d proj="$HOME/CloudStation/Projects"

# Git

  alias g='git'
  alias g='hub'
  alias gb='gitbook'
  alias t='tig'

# Node

  alias nd='node'
  alias n='npm'
  alias nr='npm run'
  alias nc="npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"

  alias gp='gulp'
  alias wp='webpack'
  alias ws='webpack-dev-server'

# React Native

  alias rn='react-native'
  alias rni='react-native run-ios'
  alias rniwith='react-native run-ios --simulator'
  alias rnid='xcrun simctl list devices'
  alias rna='react-native run-android'
  alias rnal='react-native run-android --variant=release'
  alias rnac='cd android; ./gradlew clean; cd ..'
  alias rnap='cd android; ./gradlew assembleRelease; cd ..'
  alias rnai='adb install -r ./android/app/build/outputs/apk/app-release.apk'
  alias rnag='adb logcat -d'

# Ruby on Rails

  alias rb='ruby'
  alias r='rails'
  alias b='bundle'
  alias be='bundle exec'
  alias rgc='rvm gemset create'
  alias rgl='rvm gemset list'
  alias rgu='rvm gemset use'

# Docker

  alias d='docker'
  alias dp='docker-compose'
  alias dpu='docker-compose up'
  alias dpup='docker-compose up --remove-orphans'

# Third-party

  alias sm='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
  alias st='/Applications/SourceTree.app/Contents/Resources/stree'
  alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'

  # nvbn/thefuck: https://github.com/nvbn/thefuck
  if which thefuck > /dev/null; then eval "$(thefuck --alias fuck)"; fi

  sl() {
    SUBLIME='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

    if [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
      echo 'Usage: sl <project-path> [<project-branch>]'
    elif [[ -d $1 ]] && [[ -e "$1/_$2.sublime-project" ]]; then
      echo "Info: Open sublime with the profile '${2}'."
      eval $SUBLIME "$1/_$2.sublime-project"
    elif [[ -d $1 ]] && [[ -e "$1/_index.sublime-project" ]]; then
      echo 'Info: Open sublime with the main profile.'
      eval $SUBLIME "$1/_index.sublime-project"
    elif [[ -z $1 ]] && [[ -e './_index.sublime-project' ]]; then
      echo 'Info: Open sublime with the main profile.'
      eval $SUBLIME './_index.sublime-project'
    elif [[ -n $1 ]] && [[ ! -d $1 ]]; then
      echo "Info: Open a file named '${1}'."
      eval $SUBLIME $1
    else
      echo 'Info: Current dev folder has NOT sublime project, you need to create one.'
      eval $SUBLIME .
    fi
  }

  stdev() {
    DEV_IDE='sl' # Current Code Editor is Sublime Text
    GIT_GUI='sm' # Current Git GUI is Sublime Merge
    ACTION="${DEV_IDE} . && ${GIT_GUI} ."

    if [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
      echo 'Usage: stdev <project-path>'
    elif [[ -d $1 ]]; then
      builtin cd $1 && eval $ACTION # `builtin` is required, since `cd` is not a program
    else
      eval $ACTION
    fi
  }

  stsvr() {
    PY_VER=$(python --version 2>&1 | sed 's/.* \([0-9]\).[0-9].*/\1/')
    if [[ $PY_VER == 2 ]]; then
      python -m SimpleHTTPServer
    elif [[ $PY_VER == 3 ]]; then
      python -m http.server
    else
      echo "Please confirm that the 'python-cli' is installed."
    fi
  }

  join_by() {
    local IFS="$1"
    shift
    echo "$*"
  }

  kp() {
    ports=$(join_by , $@)
    pids=$(lsof -ti:$ports)
    kill $pids
  }
