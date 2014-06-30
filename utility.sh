#!/bin/bash

APTLY=$(which aptly)

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
