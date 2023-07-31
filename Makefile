
all: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

re: install test ## rebuild binaries, run tests

install:
	go install ./...
	go vet ./...

test: ## test
	go test -v ./...
