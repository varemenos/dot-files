#!/bin/bash

__log_debug "Checking x"

if test ! "$(which fisher)"; then
  __log_debug "installing x"
else
  __log_debug "x already installed"
fi
