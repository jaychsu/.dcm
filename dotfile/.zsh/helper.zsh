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
    # Homebrew
    export http_proxy=$PROXY_URL
    export https_proxy=$PROXY_URL
    # Git
    git config --global http.proxy $PROXY_URL
    git config --global https.proxy $PROXY_URL
    git config --global http.sslverify false
    # NPM
    npm config -g set http $PROXY_URL
    npm config -g set https-proxy $PROXY_URL
    npm config -g set proxy $PROXY_URL
    npm config -g set strict-ssl false
    # Bower
    export bower_proxy=$PROXY_URL
    export bower_https_proxy=$PROXY_URL
    export bower_strict_ssl=false
  elif [[ $1 == off ]] then
    echo '\nhttp_proxy turned off'
    # Homebrew
    unset http_proxy
    unset https_proxy
    # Git
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset http.sslverify
    # NPM
    npm config -g delete http
    npm config -g delete https-proxy
    npm config -g delete proxy
    npm config -g delete strict-ssl
    # Bower
    unset bower_proxy
    unset bower_https_proxy
    unset bower_strict_ssl
  else
    echo 'Usage: http_proxy [on|off]'
  fi
}
