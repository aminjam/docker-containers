#!/bin/bash
check() {
  if [ -z "$GIT_KEY" ] || [ -z "$PRIVATE_KEY" ] || [ -z "$PLAYBOOK_PATH" ] ; then
    echo >&2 "error: hipops not initialized. Please make sure GIT_KEY and PRIVATE_KEY are set."
    exit 1
  fi
}

trap_exit() {
    while true
    do
    	echo "Press [CTRL+C] to stop.."
    	sleep 10
    done
}


execute() {
  check
  echo "initializing hipops..."
  echo $@
  chmod 400 $GIT_KEY
  chmod 400 $PRIVATE_KEY
  if [[ -n "$AWS_ACCESS_KEY_ID" ]]; then
    hipops exec -plugin ansible -private-key $PRIVATE_KEY -playbook-path $PLAYBOOK_PATH -git-key $GIT_KEY --inventory /etc/ansible/hosts $@
  else
    hipops exec -plugin ansible -private-key $PRIVATE_KEY -playbook-path $PLAYBOOK_PATH -git-key $GIT_KEY $@
  fi
}

main() {
  set +e
  set -o pipefail

  case "$1" in
  *)     execute $@;;
  esac
}

main "$@"
