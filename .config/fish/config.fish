set -U fish_greeting

source ~/.config/fish/env.fish
source ~/.config/fish/color_scheme.fish
source ~/.config/fish/my_functions.fish

# OVERRIDES

bind \cS __fzf_search_git_status # use Control + S keybinding to open fzf for git status
bind \eB prevd-or-backward-word # fix cmd + <- so it doesn't print a `B` instead of moving backwards

if command -q fisher
  echo "you need to install bat - https://github.com/jorgebucaran/fisher#installation"
end

if command -q exa
  function ls -w exa
    exa -hg --icons --group-directories-first --color=auto $argv
  end
else
  echo "you need to install exa - https://github.com/ogham/exa#installation"
end

if command -q bat
  function cat -w bat
    bat $argv
  end
else
  echo "you need to install bat - https://github.com/sharkdp/bat#installation"
end
# END OVERRIDES

function nvm
  bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end
# END OVERRIDES

# LIFECICLE HOOKS

# EVENT HOOKS
function autoload-hooks --on-variable PWD
  if test -e .nvmrc
    nvm use
  end

  if test -e .xcode-version
    # xcversion select (cat .xcode-version)
    export DEVELOPER_DIR=$HOME/Downloads/Xcode(cat .xcode-version).app/Contents/Developer
  end
end
# END EVENT HOOKS

nvm use default --silent
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

if command -q zoxide
  zoxide init fish | source
else
  echo "you need to install zoxide - https://github.com/ajeetdsouza/zoxide#getting-started"
end

# must be at the end of the file
if command -q starship
  starship init fish | source
else
  echo "you need to install starship - https://github.com/starship/starship#-installation"
end
