
# fnm
if command -q fnm
  fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --shell fish | source
end

