#!/usr/bin/env bash
#
# gw — Git Worktree Manager installer
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/graysonchen/gw/main/install.sh | bash
#

set -e

GW_HOME="$HOME/.gw"
REPO="https://github.com/graysonchen/gw.git"
SOURCE_LINE='source "$HOME/.gw/gw.sh"'

info()  { printf "\033[1;34m[gw]\033[0m %s\n" "$1"; }
ok()    { printf "\033[1;32m[gw]\033[0m %s\n" "$1"; }
err()   { printf "\033[1;31m[gw]\033[0m %s\n" "$1" >&2; exit 1; }

# --- Check dependencies ---
command -v git >/dev/null 2>&1 || err "git is required but not installed."

# --- Install / Update ---
if [ -d "$GW_HOME" ]; then
  info "Updating existing installation..."
  git -C "$GW_HOME" pull --ff-only
else
  info "Installing gw to $GW_HOME..."
  git clone "$REPO" "$GW_HOME"
fi

# --- Detect shell config file ---
detect_shell_rc() {
  case "$(basename "$SHELL")" in
    zsh)  echo "$HOME/.zshrc" ;;
    bash)
      if [ -f "$HOME/.bashrc" ]; then
        echo "$HOME/.bashrc"
      else
        echo "$HOME/.bash_profile"
      fi
      ;;
    *)    echo "" ;;
  esac
}

SHELL_RC="$(detect_shell_rc)"

# --- Add source line ---
if [ -n "$SHELL_RC" ]; then
  if ! grep -qF '.gw/gw.sh' "$SHELL_RC" 2>/dev/null; then
    info "Adding source line to $SHELL_RC..."
    echo "" >> "$SHELL_RC"
    echo "# gw — Git Worktree Manager" >> "$SHELL_RC"
    echo "$SOURCE_LINE" >> "$SHELL_RC"
  else
    info "Source line already exists in $SHELL_RC, skipping."
  fi
else
  info "Could not detect shell config. Please add manually:"
  info "  $SOURCE_LINE"
fi

# --- Done ---
echo ""
ok "gw installed successfully! 🎉"
ok "Run 'source $SHELL_RC' or open a new terminal to get started."
ok "Then try: gw help"
