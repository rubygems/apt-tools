#!/bin/bash

. ./utility.sh

DATE=$(get_date_for_snapshot)

MAIN=$(get_dated_snapshot_name ubuntu-trusty-main)
SECURITY_MAIN=$(get_dated_snapshot_name ubuntu-trusty-security-main)
UNIVERSE=$(get_dated_snapshot_name ubuntu-trusty-universe)
UPDATES_MAIN=$(get_dated_snapshot_name ubuntu-trusty-updates-main)
COMBINED=$(get_dated_sanpshot_name trusty)

$APTLY spapshot merge $COMBINED $MAIN $SECURITY_MAIN $UNIVERSE $UPDATES_MAIN

drop_published_mirror trusty
publish_snapshot_from_name $COMBINED
