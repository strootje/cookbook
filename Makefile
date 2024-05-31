BUILDFLAGS += --no-builtin-rules
IMAGES = $(wildcard images/**/Dockerfile)
-include .env.local

images/home-assistant/%:  VERSION = 2024.5
images/radicale/%:        VERSION = 3.2.0.0

images: $(IMAGES:images/%/Dockerfile=images/%/build)

images/%/build: images/%/Dockerfile
	@podman build --build-arg="VERSION=${VERSION}" --tag="strootje/$*:${VERSION}" --file="$<" "$(@D)"

images/%/push: images/%/build
	@podman push --creds="${USER}:${TOKEN}" "strootje/$*:${VERSION}" "${REGISTRY}/strootje/$*:${VERSION}"
# @podman push --creds="${USER}:${TOKEN}" "strootje/$*:${VERSION}" "${REGISTRY}/strootje/$*:latest"
