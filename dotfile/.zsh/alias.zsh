# Shell
# ======
alias grep='grep --color'
alias lal='ls -al'
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

# Git
# ======
alias g='git'
alias g='hub'
alias gb='gitbook'
alias t='tig'

# Node
# ======
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
# ======
alias rn='react-native'
alias rni='react-native run-ios'
alias rniwith='react-native run-ios --simulator'
alias rna='react-native run-android'
alias rnal='react-native run-android --variant=release'
alias rnac='cd android; ./gradlew clean; cd ..'
alias rnap='cd android; ./gradlew assembleRelease; cd ..'
alias rnai='adb install -r ./android/app/build/outputs/apk/app-release.apk'
alias rnag='adb logcat -d'

# Ruby on Rails
# ======
alias rb='ruby'
alias r='rails'
alias b='bundle'
alias be='bundle exec'
alias rgc='rvm gemset create'
alias rgl='rvm gemset list'
alias rgu='rvm gemset use'

# Docker
# ======
alias d='docker'
alias dp='docker-compose'

# Third-party
# ======
alias st='/Applications/SourceTree.app/Contents/Resources/stree'

# nvbn/thefuck: https://github.com/nvbn/thefuck
if which thefuck > /dev/null; then eval "$(thefuck --alias fuck)"; fi

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
  # Current Code Editor is Sublime
  DEV_IDE='sl'
  # Current Git GUI is SourceTree
  GIT_GUI='st'
  ACTION="open . && ${DEV_IDE} . && ${GIT_GUI} ."

  # `builtin` is required, since `cd` is not a program
  if [[ $# == 1 ]]; then
    builtin cd $1 && eval $ACTION
  else
    echo 'Usage: stdev <project-path>'
  fi
}

stsvr() {
  PY_VER=$(python --version 2>&1 | sed 's/.* \([0-9]\).[0-9].*/\1/')
  if [ $PY_VER == 2 ]; then
    python -m SimpleHTTPServer
  else
    python -m http.server
  fi
}
