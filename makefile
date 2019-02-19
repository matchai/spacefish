#!/usr/bin/make -sf

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true

.PHONY: default
default: usage
usage:
	@printf "usage:"
	@printf "\tmake build-spacefish-on FISH_VERSION=3.0.0\t# build container\n"
	@printf "\tmake test-spacefish-on  FISH_VERSION=3.0.0\t# run tests\n"
	@printf "\tmake dev-spacefish-on   FISH_VERSION=3.0.0\t# dev in container\n"

.PHONY: build-spacefish-on
build-spacefish-on:
	docker build \
		--file ./scripts/spacefish-on-fish.Dockerfile \
		--build-arg FISH_VERSION=${FISH_VERSION} \
		--tag=spacefish-on-fish-${FISH_VERSION} \
		./

.PHONY: test-spacefish-on
test-spacefish-on:
	docker run \
		--name test-spacefish-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		spacefish-on-fish-${FISH_VERSION}

.PHONY: dev-spacefish-on
dev-spacefish-on:
	docker run \
		--name run-spacefish-on-${FISH_VERSION} \
		--rm \
		--interactive \
		--tty \
		--volume=$$(pwd):/tmp/.spacefish-repo/ \
		spacefish-on-fish-${FISH_VERSION}
