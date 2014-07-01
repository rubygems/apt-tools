#!/bin/bash

. ./utility.sh

DATE=$(get_date_for_snapshot)

MAIN=$(get_dated_snapshot_name ubuntu-trusty-main)
create_snapshot_from_name $MAIN ubuntu-trusty-main

SECURITY_MAIN=$(get_dated_snapshot_name ubuntu-trusty-security-main)
create_snapshot_from_name $SECURITY_MAIN ubuntu-trusty-security-main

UNIVERSE=$(get_dated_snapshot_name ubuntu-trusty-universe)
create_snapshot_from_name $UNIVERSE ubuntu-trusty-universe

UPDATES_MAIN=$(get_dated_snapshot_name ubuntu-trusty-updates-main)
create_snapshot_from_name $UPDATES_MAIN ubuntu-trusty-updates-main

COMBINED=$(get_dated_snapshot_name trusty)

$APTLY snapshot merge $COMBINED $MAIN $SECURITY_MAIN $UNIVERSE $UPDATES_MAIN

drop_published_mirror trusty
publish_snapshot_from_name $COMBINED trusty
