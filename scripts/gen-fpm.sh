#!/bin/bash

# pre-define variables
LINUX_USER=$(whoami)

# dPanel build dynamic variable
APP_NAME=$1
APP_PORT=$2
APP_DIR=/home/${LINUX_USER}/run/php-fpm

# create fpm run folder
if [ ! -d "${APP_DIR}" ]; then
  mkdir -p ${APP_DIR}
fi

#  create fpm config
cat > ${APP_DIR}/${APP_NAME}.conf <<EOL
[global]
pid = /home/${LINUX_USER}/logs/${APP_NAME}/process.pid
error_log = /home/${LINUX_USER}/logs/${APP_NAME}/php-error.log

[${APP_NAME}]
listen = ${APP_DIR}/${APP_NAME}.sock
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
php_admin_value[error_log] = /home/${LINUX_USER}/logs/${APP_NAME}/\$pool.error.log

slowlog=/home/${LINUX_USER}/logs/${APP_NAME}/\$pool.slow.log
request_slowlog_timeout=10s
EOL
