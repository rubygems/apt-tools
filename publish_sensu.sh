#!/bin/bash

. ./utility.sh

SNAPSHOT=$(get_dated_snapshot_name sensu)

create_snapshot_from_name $SNAPSHOT
publish_snapshot_from_name $SNAPSHOT
