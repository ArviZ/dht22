.DEFAULT_GOAL := help

build: ## Force rebuild container
	docker build -t dht22 -f docker/Dockerfile .

up: ## Creates and starts the docker containers
	docker-compose -f docker/docker-compose.yml up -d
	docker-compose ps

down: ## Stops and removes the docker containers
	docker-compose down

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
