#!/usr/bin/env fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx GPG_TTY (tty)

set -gx nvm_default_version v16

fish_add_path /usr/local/sbin
fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.rbenv/shims
