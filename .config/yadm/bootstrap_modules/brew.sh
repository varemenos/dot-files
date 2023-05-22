#!/bin/bash

if [ "$__SYSTEM_TYPE" = "Darwin" ]; then
  __log_debug "Checking brew"

  if test ! "$(which brew)"; then
    __log_debug "installing Homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    __log_debug "Homebrew already installed"
  fi

  if [ -f "$HOME/.Brewfile" ]; then
    __log_debug "updating Homebrew bundle"

    brew bundle --global
  else
    __log_debug "Brewfile wasn't be located"
  fi
fi
