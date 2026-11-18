#!/usr/bin/env bash
# Runtime command for dPanel: starts FrankenPHP with the configuration that
# scripts/build.sh wrote. dPanel gives the app its port in $PORT.
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_NAME="$(basename "${APP_DIR}")"
cd "${APP_DIR}"

# Optional local overrides; dPanel passes runtime variables directly.
if [[ -f .env ]]; then
  set -a
  # shellcheck source=/dev/null
  source .env
  set +a
fi

exec frankenphp run --config "run/frankenphp/${APP_NAME}.Caddyfile"
