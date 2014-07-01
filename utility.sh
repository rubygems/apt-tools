#!/bin/bash

export APTLY=$(which aptly)

function get_date_for_snapshot() {
  echo $(date +"%m%d%Y%H%m%S")
}

function get_dated_snapshot_name() {
  NAME=$1
  DATE=$(get_date_for_snapshot)

  echo "${NAME}-${DATE}"
}

function create_snapshot_from_name() {
  NAME=$1
  MIRROR=$2

  $APTLY snapshot create $NAME from mirror $MIRROR
}

function drop_published_mirror() {
  NAME=$1

  $APTLY publish drop $NAME
}

function publish_snapshot_from_name() {
  NAME=$1
  DISTRO=$2

  $APTLY publish snapshot -distribution="${DISTRO}" $NAME
}

function get_ubuntu_repos() {
  $APTLY mirror list | grep ubuntu | awk 'NR>1{print $1}' RS='[' FS=']:'
}
