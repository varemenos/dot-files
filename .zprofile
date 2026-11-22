# Put fnm's Node ahead of Homebrew's for every login shell. macOS's /etc/zprofile (path_helper)
# moves /opt/homebrew/bin to the front first; ~/.zshrc only runs for interactive shells.
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --log-level error --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"
fi
