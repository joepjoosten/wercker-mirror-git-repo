#!/bin/bash

if [ ! -n "$WERCKER_MIRROR_GIT_REPO_ORIGIN" ]; then
	error 'Please specify a origin'
	exit 1
fi

if [ ! -n "$WERCKER_MIRROR_GIT_MIRROR" ]; then
	error 'Please specify a mirror'
	exit 1
fi

if [ -d "$WERCKER_CACHE_DIR/mirror-git-repo" ]; then
    debug "updating mirror"
    cd $WERCKER_CACHE_DIR/mirror-git-repo/mirror
    git fetch -p origin
    git push --mirror
else
    debug "creating mirror, and update"
    mkdir -p $WERCKER_CACHE_DIR/mirror-git-repo
    cd $WERCKER_CACHE_DIR/mirror-git-repo
    git clone --mirror $WERCKER_MIRROR_GIT_REPO_ORIGIN mirror
    cd mirror
    git remote set-url --push origin $WERCKER_MIRROR_GIT_MIRROR
    git fetch -p origin
    git push --mirror
fi
