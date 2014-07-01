#!/bin/bash

. ./utility.sh

for repo in $(get_all_repos); do $APTLY mirror update $repo; done
