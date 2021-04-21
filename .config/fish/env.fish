#!/usr/bin/env fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx GPG_TTY (tty)

set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths
set --universal nvm_default_version v16
