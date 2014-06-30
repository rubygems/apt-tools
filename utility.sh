#!/bin/bash

export APTLY=$(which aptly)

function get_dated_snapshot_name() {
  NAME=$1
  DATE=$(date +"%m%d%Y")

  echo "${NAME}-${DATE}"
}

function create_snapshot_from_name() {
  NAME=$1
  SNAPSHOT=$(get_dated_snapshot_name $1)

  $APTLY snapshot create $SNAPSHOT from mirror $NAME
}

function get_ubuntu_repos() {
  $APTLY mirror list | grep ubuntu | awk 'NR>1{print $1}' RS='[' FS=']:'
}
