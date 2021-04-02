export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD

  [[ -f ".xcode-version" ]] && xcversion select $(cat .xcode-version)
  [[ -f ".nvmrc" ]] && nvm use
}
export PROMPT_COMMAND=enter_directory

eval "$(zoxide init bash)"
eval "$(starship init bash)"
