# gw completions for zsh
# Source this file in ~/.zshrc:
#   source /path/to/gw/completions/gw.zsh

# Add the completions directory to fpath
fpath=("${0:A:h}" $fpath)

# Enable completions
autoload -U compinit && compinit
