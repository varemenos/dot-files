#!/bin/bash
if [ "$__SYSTEM_TYPE" = "Darwin" ]; then
  __log_debug "installing Fira Code fonts for macOS"

  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
else
  if [ "$__WSL_MODE" = true ]; then
    __log_error "you need to install the Fira Code fonts manually or update this script :)
https://github.com/tonsky/FiraCode/wiki/Installing#windows"
  else
    __log_error "you need to install the Fira Code fonts manually or update this script :)
https://github.com/tonsky/FiraCode/wiki/Installing#linux"
  fi
fi
