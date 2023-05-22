GPG_TTY=$(tty)
export GPG_TTY
export BASH_SILENCE_DEPRECATION_WARNING=1

#########################################################################
# set a limit to how much the bash history file can grow
# don't put duplicate lines or lines starting with space in the  history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=200000
#########################################################################

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_DIR

# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

enter_directory() {
  if [[ $PWD == "$PREV_PWD" ]]; then
    return
  fi

  PREV_PWD=$PWD

  # no longer need to deal with xcode
  # [[ -f ".xcode-version" ]] && xcversion select $(cat .xcode-version)
  [[ -f ".nvmrc" ]] && nvm use
}
export PROMPT_COMMAND=enter_directory

# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# TODO: find alternative of zoxide for bash, I'm using a fish plugin for this
# eval "$(zoxide init bash)"
eval "$(starship init bash)"

alias g=git
alias b=bash
alias s="source ./project-control.sh"
alias f=fish
