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

# 3. Load this repo's mise.toml globally via conf.d. mise reads every file in
#    conf.d, but `mise use -g` only writes to config.toml, so tools you add
#    elsewhere never end up in the nvim config.
mkdir -p "$CONFIG_HOME/mise/conf.d"
old_link="$CONFIG_HOME/mise/config.toml"
if [[ -L "$old_link" && "$(readlink -f "$old_link")" == "$(readlink -f "$NVIM_DIR/mise.toml")" ]]; then
  rm "$old_link" # migrate from the old setup that linked config.toml itself
  echo "==> Removed old link $old_link (your own global config goes there now)"
fi
ln -sfn "$NVIM_DIR/mise.toml" "$CONFIG_HOME/mise/conf.d/nvim.toml"

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
