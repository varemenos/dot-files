#!/bin/bash

__log_debug "Checking Xcode command line tools"

if ! xcode-select --print-path &> /dev/null; then
  __log_debug "installing xcode-tools"

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
      sleep 5
  done

  __log_debug "Install XCode Command Line Tools"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  __log_debug "Make xcode-select developer directory point to Xcode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license accept
  __log_debug "Agree with the XCode Command Line Tools licence"
else
  __log_debug "XCode Command Line Tools already installed"
fi
