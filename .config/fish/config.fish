set -U fish_greeting

source ~/.config/fish/env.fish
source ~/.config/fish/color_scheme.fish
source ~/.config/fish/my_functions.fish

# OVERRIDES

#fzf_configure_bindings --git_status=\cs # use Control + S keybinding to open fzf for git status

bind \eB prevd-or-backward-word # fix cmd + <- so it doesn't print a `B` instead of moving backwards

if command -q fisher
  echo "you need to install fisher - https://github.com/jorgebucaran/fisher#installation"
end

if command -q exa
  function ls -w exa
    exa -hg --icons --group-directories-first --color=auto $argv
  end
else
  echo "you need to install exa - https://github.com/ogham/exa#installation"
end

function f -w fish
  fish
end

function b -w bash
  bash
end


if command -q bat
  function cat -w bat
    bat $argv
  end
else
  echo "you need to install bat - https://github.com/sharkdp/bat#installation"
end

# function nvm
#   replay source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
# end
# END OVERRIDES

# LIFECICLE HOOKS

# EVENT HOOKS
function autoload-hooks --on-variable PWD
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  end

  if test -f .xcode-version; and test -r .xcode-version;
    xcodes select (cat .xcode-version)
  end
end
# END EVENT HOOKS

autoload-hooks

if ! command -q fzf
  echo "you need to install fzf - https://github.com/junegunn/fzf#installation"
end

if command -q rg
  set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --no-messages --glob '!.git/*'"
else
  echo "you need to install rg - https://github.com/BurntSushi/ripgrep#installation"
end

if command -q delta
  set -gx DELTA_PAGER "less -rX"
else
  echo "you need to install delta - https://github.com/dandavison/delta#installation"
end

# must be at the end of the file
if command -q starship
  starship init fish | source
else
  echo "you need to install starship - https://github.com/starship/starship#-installation"
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# pnpm
set -gx PNPM_HOME "/Users/kakoulidis/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end