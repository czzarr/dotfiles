#!/usr/bin/env bash

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
  --exclude ".init/" \
	--exclude ".macos" \
  --exclude ".vim/" \
	--exclude "brew.sh" \
	--exclude "sync.sh" \
	-avh --no-perms . ~;
source ~/.bash_profile;
