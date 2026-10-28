if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --log-level error --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in *":$PNPM_HOME:"*) ;; *) export PATH="$PNPM_HOME:$PATH" ;; esac
# pnpm end
