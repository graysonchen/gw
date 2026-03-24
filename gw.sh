#!/usr/bin/env bash
#
# gw.sh — Single entry point for gw (Git Worktree Manager)
#
# Add to ~/.zshrc or ~/.bashrc:
#   source ~/.gw/gw.sh
#

GW_HOME="${0:a:h}"

# PATH
export PATH="$GW_HOME/bin:$PATH"

# Shell integration (enables `gw cd` to change directory)
source "$GW_HOME/shell/gw.sh"

# Completions
if [[ -f "$GW_HOME/completions/gw.zsh" ]]; then
  source "$GW_HOME/completions/gw.zsh"
fi
