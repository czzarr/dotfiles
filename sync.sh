#!/usr/bin/env bash

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".macos" \
	--exclude "brew.sh" \
	--exclude "sync.sh" \
	-avh --no-perms . ~;
source ~/.bash_profile;
