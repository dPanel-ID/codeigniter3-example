#!/usr/bin/env bash
# Build step for dPanel: prepares the writable folders CodeIgniter 3 needs and
# writes a FrankenPHP (Caddy) configuration that serves the app on $PORT.
# dPanel runs it from the repository root; it is safe to run more than once.
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_NAME="$(basename "${APP_DIR}")"
RUN_DIR="${APP_DIR}/run/frankenphp"

cd "${APP_DIR}"
echo "Preparing CodeIgniter 3 in ${APP_DIR}"

# CodeIgniter writes cache files, logs and file sessions here.
mkdir -p "${RUN_DIR}" application/cache/sessions application/logs

cat > "${RUN_DIR}/${APP_NAME}.Caddyfile" <<EOL
{
	admin off
	auto_https off

	frankenphp {
		num_threads 2
		max_threads 4
		php_ini memory_limit 128M
		php_ini expose_php Off
		php_ini log_errors On
		php_ini error_log /dev/stderr
	}
	order php_server before file_server
}

:{\$PORT:8081} {
	root * ${APP_DIR}
	encode zstd br gzip

	header {
		-Via
		-X-Powered-By
	}

	# CodeIgniter's own folders, scripts and dotfiles never leave the server.
	@private {
		path /application/* /system/* /scripts/* /run/*
		path /.git* /.env* /composer.* *.sh *.sql *.log
	}
	respond @private "Not Found" 404

	# Everything else that is not a real file goes to index.php.
	php_server
}
EOL

echo "Wrote ${RUN_DIR}/${APP_NAME}.Caddyfile"
