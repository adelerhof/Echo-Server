REGISTRY := ghcr.io/adelerhof/echo-server
VERSION  := $(shell git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')

.PHONY: build push release

build:
	@test -n "$(VERSION)" || (echo "No git tag found. Create one with: git tag v1.0.0" && exit 1)
	docker build --no-cache \
		-t $(REGISTRY):$(VERSION) \
		-t $(REGISTRY):latest \
		.

push:
	@test -n "$(VERSION)" || (echo "No git tag found. Create one with: git tag v1.0.0" && exit 1)
	docker push $(REGISTRY):$(VERSION)
	docker push $(REGISTRY):latest

release: build push
