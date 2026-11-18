#!/usr/bin/env bash
# Local development without FrankenPHP: PHP's built-in server on port 8081,
# with every PHP error shown. Open http://localhost:8081.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
mkdir -p application/cache/sessions application/logs
export CI_ENV="${CI_ENV:-development}"
exec php -d variables_order=EGPCS -S "127.0.0.1:${PORT:-8081}" index.php
