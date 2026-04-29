#!/usr/bin/env bash
# Bootstrap dotfiles on a fresh machine.
#
# What this script does:
#   1. Symlink ~/.config/nvim    -> $REPO_DIR/nvim
#   2. Symlink ~/.tmux.conf      -> $REPO_DIR/tmux/tmux.conf
#   3. Clone TPM into ~/.tmux/plugins/tpm if missing
#
# After running, open tmux and press `prefix + I` (capital i) to install plugins.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Create or refresh a symlink. Idempotent: if $target already points at $source,
# skips. If $target exists otherwise, backs it up to ${target}.backup.<timestamp>
# before creating the symlink.
link() {
  local source="$1"
  local target="$2"
  local timestamp
  timestamp="$(date +%Y%m%d-%H%M%S)"

  mkdir -p "$(dirname "$target")"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    echo "✓ $target already linked correctly — skipping"
  elif [ -e "$target" ] || [ -L "$target" ]; then
    echo "→ backing up $target -> ${target}.backup.${timestamp}"
    mv "$target" "${target}.backup.${timestamp}"
    ln -s "$source" "$target"
    echo "✓ linked $target -> $source"
  else
    ln -s "$source" "$target"
    echo "✓ linked $target -> $source"
  fi
}

# --- Step 1: symlinks --------------------------------------------------------
link "$REPO_DIR/nvim"           "$HOME/.config/nvim"
link "$REPO_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# --- Step 2: TPM bootstrap ---------------------------------------------------
if [ ! -d "$TPM_DIR" ]; then
  echo "Cloning TPM into $TPM_DIR..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "TPM already present at $TPM_DIR — skipping."
fi

echo
echo "Done. Start tmux and press prefix + I to install plugins."
