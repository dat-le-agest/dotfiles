#!/usr/bin/env bash
set -euo pipefail

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
NVIM_DIR="$CONFIG_HOME/nvim"
MISE_DATA="${MISE_DATA_DIR:-$HOME/.local/share/mise}"

# 1. Required system tools
missing=()
for cmd in git curl tar unzip gzip cc make; do
  command -v "$cmd" >/dev/null || missing+=("$cmd")
done
if ((${#missing[@]})); then
  echo "Error: missing ${missing[*]}"
  echo "  Install them with your system package manager, then run this script again."
  exit 1
fi

# 2. mise (no root needed)
if ! command -v mise >/dev/null; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$MISE_DATA/shims:$PATH"

# 3. Link this repo's mise.toml as the global mise config
mkdir -p "$CONFIG_HOME/mise"
target="$CONFIG_HOME/mise/config.toml"
if [[ -e "$target" && ! -L "$target" ]]; then
  mv "$target" "$target.bak.$(date +%s)"
  echo "==> Backed up existing mise config to $target.bak.*"
fi
ln -sf "$NVIM_DIR/mise.toml" "$target"

# Unauthenticated GitHub API allows only 60 requests/hour, so mise often hits 403.
# Use the gh CLI token if none is set in the environment.
if [[ -z "${MISE_GITHUB_TOKEN:-}${GITHUB_TOKEN:-}" ]]; then
  if command -v gh >/dev/null && token="$(gh auth token 2>/dev/null)" && [[ -n "$token" ]]; then
    export MISE_GITHUB_TOKEN="$token"
    echo "==> Using GitHub token from gh CLI for mise"
  else
    echo "Warning: no GitHub token, mise may hit the rate limit (60 requests/hour)."
    echo "  Run 'gh auth login' or export MISE_GITHUB_TOKEN=<token>, then run this script again."
  fi
fi

mise install

# 4. Plugins (pinned to lazy-lock.json if present)
if [[ -f "$NVIM_DIR/lazy-lock.json" ]]; then
  nvim --headless "+Lazy! restore" +qa
else
  nvim --headless "+Lazy! sync" +qa
fi

# 5. LSP servers / formatters via Mason
nvim --headless "+MasonToolsInstallSync" +qa

echo
echo "Done. Add this line to ~/.bashrc or ~/.zshrc if it is not there yet:"
echo '  eval "$(~/.local/bin/mise activate bash)"   # or zsh'
echo "Treesitter parsers will be installed the first time you open nvim."
