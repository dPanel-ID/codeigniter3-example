package main

import (
	"log"
	"net/http"
	"os"

	"github.com/yookoala/gofast"
)

// dev server without web server
func main() {
	PHP_FASTCGI_UPSTREAM := os.Getenv("PHP_FASTCGI_UPSTREAM")
	PHP_FASTCGI_ROOT_DIR := os.Getenv("PHP_FASTCGI_ROOT_DIR")
	DEV_SERVER_PORT := os.Getenv("DEV_SERVER_PORT")

	// Get fastcgi application server tcp address
	// from env FASTCGI_ADDR. Then configure
	// connection factory for the address.
	address := PHP_FASTCGI_UPSTREAM
	connFactory := gofast.SimpleConnFactory("tcp", address)

	// route all requests to a single php file
	http.Handle("/", gofast.NewHandler(
		gofast.NewFileEndpoint(PHP_FASTCGI_ROOT_DIR)(gofast.BasicSession),
		gofast.SimpleClientFactory(connFactory),
	))

	// serve at 8080 port
	log.Fatal(http.ListenAndServe(":"+DEV_SERVER_PORT, nil))
}
