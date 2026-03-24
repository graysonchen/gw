#!/usr/bin/env bash
#
# gw.sh — Shell integration for gw (Git Worktree Manager)
#
# Source this in your ~/.zshrc or ~/.bashrc:
#   source ~/.gw/shell/gw.sh
#
# This wraps the `gw` binary to enable `gw cd` (which needs
# to run in the current shell, not a subshell).
#

# Keep reference to the real gw binary
__gw_bin="$(command -v gw 2>/dev/null || echo "${0%/*}/../bin/gw")"

gw() {
  case "${1:-}" in
    cd)
      shift
      local dir
      dir="$("$__gw_bin" cd "$@")"
      if [[ -n "$dir" && -d "$dir" ]]; then
        cd "$dir" || return 1
        echo "📍 $(pwd) [$(git branch --show-current 2>/dev/null)]"
      fi
      ;;
    add|a)
      # Run add, then offer to cd
      "$__gw_bin" "$@"  # note: $@ still has "add" as $1... fix below
      ;;
    *)
      "$__gw_bin" "$@"
      ;;
  esac
}
