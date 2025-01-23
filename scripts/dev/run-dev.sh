#!/bin/bash

export PHP_FASTCGI_UPSTREAM=127.0.0.1:7500
export PHP_FASTCGI_ROOT_DIR=$(pwd)/index.php

# your web server
export DEV_SERVER_PORT=8081


cd scripts &&  go run main.go
