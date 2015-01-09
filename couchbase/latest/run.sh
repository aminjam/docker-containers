#!/bin/bash

check() {
  if [ -z "$COUCHBASE_USER" ] || [ -z "$COUCHBASE_PASS" ]; then
    echo >&2 "error: Couchbase not initialized. Please make sure COUCHBASE_USER and COUCHBASE_PASS are set."
    exit 1
  fi
}

start() {
  local counter=1
  "$@"
  while [ $? -ne 0 ]; do
    if [[ "$CLI" == "true" && "$counter" -ge 10 ]]; then
      echo "server didn't start in 50 seconds, exiting now..."
      exit
    fi
    counter=$[$counter +1]
    echo "waiting for couchbase to start..."
    sleep 5
    "$@"
  done
}

get_ip() {
  local eth1=$(ip addr show dev eth1 | sed -e's/^.*inet \([^ ]*\)\/.*$/\1/;t;d')
  if [[ -z "$eth1" ]]; then
    local eth0=$(ip addr show dev eth0 | sed -e's/^.*inet \([^ ]*\)\/.*$/\1/;t;d')
    if [[ -z "$eth0" ]]; then
      local enp0s8=$(ip addr show dev enp0s8 | sed -e's/^.*inet \([^ ]*\)\/.*$/\1/;t;d')
      echo $enp0s8
    else
      echo $eth0
    fi
  else
    echo $eth1
  fi
}

wait_for_shutdown() {
  local pid_file=/opt/couchbase/var/lib/couchbase/couchbase-server.pid

  # can't use 'wait $(<"$pid_file")' as process not child of shell
  while [ -e /proc/$(<"$pid_file") ]; do sleep 5; done
}

check_data_persistence() {
  if [[ -n "$COUCHBASE_DATA" ]]; then
    echo "change data path owner to couchbase"
    chown -R couchbase $COUCHBASE_DATA
    echo "initializing node..."
    start /opt/couchbase/bin/couchbase-cli node-init -c $ip:8091 -u "$COUCHBASE_USER" -p "$COUCHBASE_PASS" --node-init-data-path=$COUCHBASE_DATA
  fi
}

cluster_init() {
  check
  local ip=$(get_ip)
  if [ -z "$CLUSTER_RAM_SIZE" ]; then
    CLUSTER_RAM_SIZE=256
  fi
  check_data_persistence
  echo "initializing cluster..."
  start /opt/couchbase/bin/couchbase-cli cluster-init -c $ip:8091 -u "$COUCHBASE_USER" -p "$COUCHBASE_PASS" --cluster-init-ramsize=$CLUSTER_RAM_SIZE --cluster-username="$COUCHBASE_USER" --cluster-password="$COUCHBASE_PASS"
}

rebalance() {
  check
  local ip=$(get_ip)
  check_data_persistence
  echo "adding server with rebalance..."
  start /opt/couchbase/bin/couchbase-cli rebalance -c $COUCHBASE_SERVER:8091 -u "$COUCHBASE_USER" -p "$COUCHBASE_PASS" --server-add=$ip:8091 --server-add-username="$COUCHBASE_USER" --server-add-password="$COUCHBASE_PASS"
}

cli() {
  CLI="true"
  start $@
}

start_couchbase() {
  echo "starting couchbase"
  /etc/init.d/couchbase-server start

  trap "/etc/init.d/couchbase-server stop" exit INT TERM
}

main() {
  set +e
  set -o pipefail

  case "$1" in
    cluster-init)    start_couchbase && cluster_init && wait_for_shutdown;;
    rebalance)       start_couchbase && rebalance    && wait_for_shutdown;;
    *)               cli $@;;
  esac
}

main "$@"
