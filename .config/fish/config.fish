set -U fish_greeting

source ~/.config/fish/env.fish
source ~/.config/fish/my_functions.fish

set fish_user_paths $fish_user_paths ~/.rbenv/shims

# SSH-AGENT
# function start_ssh_agent
#   ssh-add -l | grep "The agent has no identities" > /dev/null
#   if [ $status -eq 0 ]
#     ssh-add
#   end
# end
# start_ssh_agent
# END SSH-AGENT

# OVERRIDES

bind \cS __fzf_search_git_status # use Control + S keybinding to open fzf for git status

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

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
# END OVERRIDES

# LIFECICLE HOOKS
function autonvm --on-variable PWD
  if test -e .nvmrc
    nvm use
  end

  if test -e .xcode-version
    # xcversion select (cat .xcode-version)
    export DEVELOPER_DIR=/Users/adonisk/Downloads/Xcode(cat .xcode-version).app/Contents/Developer
  end
end

# END HOOKS

# autoprojectcontrol
autonvm

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
