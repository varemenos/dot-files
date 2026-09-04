#!/usr/bin/env fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

test -t 0; and set -gx GPG_TTY (tty)

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.rbenv/shims

# fzf
fish_add_path /opt/homebrew/opt/fzf/bin
fish_add_path $HOME/.fzf/bin

# android dev
set -gx ANDROID_HOME /opt/homebrew/share/android-commandlinetools
set -gx ANDROID_SDK_ROOT /opt/homebrew/share/android-commandlinetools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools


