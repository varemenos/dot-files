#!/bin/bash

__log_debug "Checking nvm"

export NVM_DIR="$HOME/.nvm"

if [ ! -e "$NVM_DIR/nvm.sh" ]; then
	__log_debug "Installing nvm"

	#https://github.com/creationix/nvm#manual-install
	git clone https://github.com/creationix/nvm.git "$NVM_DIR"
	pushd "$NVM_DIR"
else
	__log_debug "nvm is already installed, upgrading."

  # https://github.com/creationix/nvm#manual-upgrade
	pushd "$NVM_DIR"
	git fetch origin
	git checkout .
fi

git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
. "$NVM_DIR/nvm.sh"

nvm install 'lts/*'
nvm install stable

nvm alias current 'lts/*'
nvm alias default current

nvm use default

popd
