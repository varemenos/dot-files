
# fnm
set FNM_PATH "$HOME/.fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines | source
end
