
# fnm
set FNM_PATH "/opt/homebrew/bin"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines | source
else
  echo "fnm path not found: $FNM_PATH"
  echo "fnm not installed"
end
