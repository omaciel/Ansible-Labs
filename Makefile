.PHONY: all attach build dev lint run stop

OCI_TOOL=$(shell command -v podman || command -v docker)

attach:
	$(OCI_TOOL) exec -it controller /bin/bash

build: lint
	$(OCI_TOOL) buildx create --use
	cd controller && $(OCI_TOOL) buildx build --push --platform linux/arm64,linux/amd64 -t quay.io/omaciel/ansible_lab_controller:latest .
	cd host && $(OCI_TOOL) buildx build --push --platform linux/arm64,linux/amd64 -t quay.io/omaciel/ansible_lab_host:latest .
	$(OCI_TOOL) buildx stop
	$(OCI_TOOL) buildx rm

dev:
	pip3 install yamllint

run:
	$(OCI_TOOL)-compose up --pull=always -d

lint: dev
	yamllint docker-compose.yml 

stop:
	$(OCI_TOOL)-compose down

help:
	@echo "Please use \`make <target>' where <target> is one of:"
	@echo ""
	@echo "--- General Commands ---"
	@echo "attach       Attaches to a running 'controller' container."
	@echo "build		Build and push new images to Quay.io."
	@echo "dev			Install development tools and dependencies."
	@echo "lint			Runs linter on docker-compose.yaml file."
	@echo "run 			Spin up a lab with 1 controller and 2 hosts."
	@echo "stop			Shuts down the lab."
