#!/bin/bash

export APTLY=$(which aptly)

function get_dated_snapshot_name() {
  NAME=$1
  DATE=$(date + "%m%d%Y%H%m%S")

  echo "${NAME}-${DATE}"
}

function create_snapshot_from_name() {
  NAME=$1
  MIRROR=$2

  $APTLY snapshot create $SNAPSHOT from mirror $NAME
}

function publish_snapshot_from_name() {
  NAME=$1
  
  $APTLY publish snapshot $NAME
}

function get_ubuntu_repos() {
  $APTLY mirror list | grep ubuntu | awk 'NR>1{print $1}' RS='[' FS=']:'
}
