set -U fish_greeting

source ~/.config/fish/env.fish
source ~/.config/fish/my_functions.fish

set fish_user_paths $fish_user_paths ~/.rbenv/shims

# OVERRIDES

bind \cS __fzf_search_git_status # use Control + S keybinding to open fzf for git status
bind \eB prevd-or-backward-word # fix cmd + <- so it doesn't print a `B` instead of moving backwards

if command -q exa
  function ls -w exa
    exa -hg --icons --group-directories-first --color=auto $argv
  end
end

if command -q bat
  function cat -w bat
    bat $argv
  end
end
# END OVERRIDES

# EVENT HOOKS
function autoload-hooks --on-variable PWD
  if test -e .xcode-version
    # xcversion select (cat .xcode-version)
    export DEVELOPER_DIR=/Users/adonisk/Downloads/Xcode(cat .xcode-version).app/Contents/Developer
  end
end
# END EVENT HOOKS

load_nvm
autoload-hooks

if command -q rg
  set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --no-messages --glob '!.git/*'"
else
  echo "you need to install rg (ripgrep)!"
end

if command -q delta
  set -gx DELTA_PAGER "less -rX"
else
  echo "you need to install delta (git-delta)!"
end

if command -q zoxide
  zoxide init fish | source
else
  echo "you need to install zoxide"
end

# must be at the end of the file
if command -q starship
  starship init fish | source
else
  echo "you need to install starship"
end
