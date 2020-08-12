.DEFAULT_GOAL := help

build: ## Force rebuild container
	@docker build -t dht22 -f docker/Dockerfile .

run: ## Get values from dht22
	@docker run --rm --privileged dht22 ./dht22

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
