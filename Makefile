current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/sh

app-name := $(shell grep "APP_NAME" .env | awk -F '=' '{print $$2}')
img-name := "$(app-name):1.0"

cont-port := $(shell grep "CONT_PORT" .env | awk -F '=' '{print $$2}')

.PHONY: build
build:
	@docker build -t $(img-name) . \
			--build-arg APP_NAME=$(app-name) \
			--build-arg CONT_PORT=$(cont-port)
	@echo "📦 Build done"
