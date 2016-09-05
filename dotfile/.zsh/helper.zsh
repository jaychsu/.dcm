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
