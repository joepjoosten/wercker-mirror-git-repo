#!/bin/bash

if [ ! -n "$WERCKER_MIRROR_GIT_REPO_ACCESS_TOKEN" ]; then
	error 'Please specify an access token for the reposity to mirror'
	exit 1
fi

if [ ! -n "$WERCKER_MIRROR_GIT_REPO_MIRROR" ]; then
	error 'Please specify a mirror repository'
	exit 1
fi

git clone --mirror https://$WERCKER_MIRROR_GIT_REPO_ACCESS_TOKEN@$WERCKER_GIT_DOMAIN/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git mirror
cd mirror
git remote set-url --push origin $WERCKER_MIRROR_GIT_REPO_MIRROR
git fetch -p origin
git push --mirror
success "Updated the mirror"
