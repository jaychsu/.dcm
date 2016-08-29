# helper
command_exists() {
  type "$1" &> /dev/null
}

run_task() {
  if [[ -z $1 ]] then
    echo 'Usage: run_task <task_name> <task_function>'
    exit 1
  fi

  TASK_NAME=$1
  TASK_COMMAND=$2

  START=`date +%s%N`
  echo "Starting '$TASK_NAME'..."

  $TASK_COMMAND

  END=`date +%s%N`
  RUNTIME=$(awk "BEGIN {printf \"%.2f\",(${END}-${START})/(10 ** 6)}")
  echo "Finished '$TASK_NAME' after $RUNTIME(ms)"
}

http_proxy() {
  if [[ $1 == on ]] then
    echo 'http_proxy turned on'
    export http_proxy=$PROXY_URL
    export https_proxy=$PROXY_URL
  elif [[ $1 == off ]] then
    echo '\nhttp_proxy turned off'
    unset http_proxy
    unset https_proxy
  else
    echo 'Usage: http_proxy [on|off]'
  fi
}

ce() {
  if [[ $# == 1 ]] then
    mkdir $1 && cd $1
  else
    echo 'Warn: Only receive one parameter!'
  fi
}

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
