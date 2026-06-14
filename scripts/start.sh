#!/bin/bash


export CURRENT_DIR=$(pwd)
export LINUX_USER=$(whoami)
export APP_NAME=$(basename "$CURRENT_DIR")
export FRANKEN_DIR=${CURRENT_DIR}/run/frankenphp
export PHP_FPM_DIR=${CURRENT_DIR}/run/php-fpm

# Load environment variables dari .env jika ada
if [ -f "${CURRENT_DIR}/.env" ]; then
  set -a
  # shellcheck source=../.env
  source "${CURRENT_DIR}/.env"
  set +a
  echo "[start] .env loaded"
fi

php-fpm --nodaemonize --fpm-config ${PHP_FPM_DIR}/${APP_NAME}.conf
