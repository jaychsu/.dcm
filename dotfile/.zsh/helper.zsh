# helper
command_exists() {
  type "$1" &> /dev/null
}

run_task() {
  if [ -z "$1" ]; then
    echo 'Usage: run_task <task_name> <task_function>'
    return 1
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
  if [ "$1" = on ]; then

    if [ -z ${PROXY_URL+x} ]; then
      echo "'PROXY_URL' is not found. Please set 'PROXY_URL' first."
    else
      echo "'PROXY_URL' set to '${PROXY_URL}'"
    fi

    # ENV VAR
    export http_proxy=$PROXY_URL
    export https_proxy=$PROXY_URL
    # Git
    git config --global http.proxy $PROXY_URL
    git config --global https.proxy $PROXY_URL
    git config --global http.sslverify false
    # NPM
    npm config set http $PROXY_URL
    npm config set https-proxy $PROXY_URL
    npm config set proxy $PROXY_URL
    npm config set strict-ssl false
    # Bower
    export bower_proxy=$PROXY_URL
    export bower_https_proxy=$PROXY_URL
    export bower_strict_ssl=false
  elif [ "$1" = off ]; then
    echo "'PROXY_URL' is removed."
    # ENV VAR
    unset http_proxy
    unset https_proxy
    # Git
    git config --global http.proxy ''
    git config --global https.proxy ''
    git config --global http.sslverify ''
    # NPM
    npm config delete http
    npm config delete https-proxy
    npm config delete proxy
    npm config delete strict-ssl
    # Bower
    unset bower_proxy
    unset bower_https_proxy
    unset bower_strict_ssl
  else
    echo 'Usage: http_proxy [on|off]'
  fi
}
