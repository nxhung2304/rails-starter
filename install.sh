#!/usr/bin/env bash
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/nxhung2304/rails-starter/main/install.sh | bash -s <app-name> [path]
#
# Examples:
#   curl -fsSL ... | bash -s todo-api
#   curl -fsSL ... | bash -s todo-api ~/Dev/work

set -euo pipefail

APP_NAME="${1:-}"
BASE_DIR="${2:-$(pwd)}"
REPO_URL="https://github.com/nxhung2304/rails-starter"
LOCAL_STARTER="${RAILS_STARTER_DIR:-$HOME/Dev/personal/rails-starter}"

if [ -z "$APP_NAME" ]; then
  echo "Usage: curl -fsSL $REPO_URL/install.sh | bash -s <app-name> [destination-dir]"
  exit 1
fi

APP_PATH="$BASE_DIR/$APP_NAME"

if [ -d "$LOCAL_STARTER" ] && [ -f "$LOCAL_STARTER/bin/new" ]; then
  echo "Using local rails-starter at $LOCAL_STARTER"
  ruby "$LOCAL_STARTER/bin/new" "$APP_PATH"
else
  echo "rails-starter not found locally. Cloning from $REPO_URL..."
  TMP=$(mktemp -d)
  trap 'rm -rf "$TMP"' EXIT
  git clone --depth=1 "$REPO_URL" "$TMP/rails-starter"
  ruby "$TMP/rails-starter/bin/new" "$APP_PATH"
fi
