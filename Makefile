BUILDFLAGS += --no-builtin-rules
IMAGES = $(wildcard images/**/Dockerfile)
PODMAN ?= podman
-include .env.local

VERSION = 0.1.0
images/home-assistant/%:  VERSION = 2024.5
images/radicale/%:        VERSION = 3.2.0.0

images: $(IMAGES:images/%/Dockerfile=images/%/build)

images/%/build: images/%/Dockerfile
	@$(PODMAN) build --build-arg="VERSION=${VERSION}" --tag="strootje/$*:${VERSION}" --file="$<" "$(@D)"

images/%/push: images/%/build
	@$(PODMAN) push --creds="${USER}:${TOKEN}" "strootje/$*:${VERSION}" "${REGISTRY}/strootje/$*:${VERSION}"
# @$(PODMAN) push --creds="${USER}:${TOKEN}" "strootje/$*:${VERSION}" "${REGISTRY}/strootje/$*:latest"
