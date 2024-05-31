IMAGES = $(wildcard images/**/Dockerfile)

images/home-assistant: VERSION = 2024.5
images/radicale: VERSION = 3.2.0.0

images: $(IMAGES:images/%/Dockerfile=images/%)

images/%: images/%/Dockerfile
	@podman build \
		--build-arg="VERSION=${VERSION}" \
		--tag="strootje/$*:${VERSION}" \
		--file="$<" \
		"$(@D)"
