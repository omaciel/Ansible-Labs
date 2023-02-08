.PHONY: all build-all-arch run stop

build-all-arch:
	docker buildx create --use
	cd controller && docker buildx build --push --platform linux/arm64,linux/amd64 -t quay.io/omaciel/ansible_lab_controller:latest .
	cd ../host && docker buildx build --push --platform linux/arm64,linux/amd64 -t quay.io/omaciel/ansible_lab_host:latest .
	cd .. && docker buildx stop
run:
	docker-compose up -d

stop:
	docker-compose down

help:
	@echo "Please use \`make <target>' where <target> is one of:"
	@echo ""
	@echo "--- General Commands ---"
	@echo "build-all-arch		Build and push new images to Quay.io."
	@echo "run 					Spin up a lab with 1 controller and 2 hosts."
	@echo "stop					Shuts down the lab."