#!/usr/bin/env fish

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx GPG_TTY (tty)

fish_add_path /usr/local/sbin

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.rbenv/shims

fish_add_path $HOME/Library/Python/3.10/bin

# fzf
fish_add_path /usr/local/opt/fzf/bin
fish_add_path $HOME/.fzf/bin

# java 11
# only works for mac os
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home/
# android
set -gx ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -gx ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools

# openssh hack for vimla
fish_add_path $HOME/bin
