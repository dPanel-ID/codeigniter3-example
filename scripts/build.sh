#!/bin/bash

CURRENT_DIR=$(pwd)
LINUX_USER=$(whoami)
APP_NAME=$(basename "$CURRENT_DIR")
FRANKEN_DIR=${CURRENT_DIR}/run/frankenphp
PHP_FPM_DIR=${CURRENT_DIR}/run/php-fpm

# create php-fpm config folder if not exist
if [ ! -d "${PHP_FPM_DIR}" ]; then
  mkdir -p ${PHP_FPM_DIR}
fi

#  create fpm config
cat > ${PHP_FPM_DIR}/${APP_NAME}.conf <<EOL
[global]
pid = ${CURRENT_DIR}/logs/${APP_NAME}/process.pid
error_log = ${CURRENT_DIR}/logs/${APP_NAME}/php-error.log

[${APP_NAME}]
listen = ${PHP_FPM_DIR}/${APP_NAME}.sock
listen.allowed_clients = 127.0.0.1

clear_env = no

pm = static
pm.max_children = 3
pm.start_servers = 2
pm.min_spare_servers = 2
pm.max_spare_servers = 2
pm.max_requests = 500

php_admin_flag[display_errors] = off
php_admin_flag[log_errors] = on
php_admin_value[error_log] = ${CURRENT_DIR}/logs/${APP_NAME}/\$pool.error.log

slowlog=${CURRENT_DIR}/logs/${APP_NAME}/\$pool.slow.log
request_slowlog_timeout=10s
EOL
