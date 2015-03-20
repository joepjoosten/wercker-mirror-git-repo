#!/bin/bash

if [ ! -n "$WERCKER_MIRROR_GIT_REPO_ACCESS_TOKEN" ]; then
	error 'Please specify an access token for the reposity to mirror'
	exit 1
fi

if [ ! -n "$WERCKER_MIRROR_GIT_REPO_MIRROR" ]; then
	error 'Please specify a mirror repository'
	exit 1
fi

if [ -d "$WERCKER_CACHE_DIR/mirror-git-repo" ]; then
    debug "updating mirror"
    cd $WERCKER_CACHE_DIR/mirror-git-repo/mirror
    git fetch -p origin
    git push --mirror
    success "Update the mirror"
else
    debug "creating mirror, and update"
    mkdir -p $WERCKER_CACHE_DIR/mirror-git-repo
    cd $WERCKER_CACHE_DIR/mirror-git-repo
    git clone --mirror https://$WERCKER_MIRROR_GIT_REPO_ACCESS_TOKEN@$WERCKER_GIT_DOMAIN/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git mirror
    cd mirror
    git remote set-url --push origin $WERCKER_MIRROR_GIT_REPO_MIRROR
    git fetch -p origin
    git push --mirror
    success "Created and updated the mirror"
fi
