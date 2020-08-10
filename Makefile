.DEFAULT_GOAL := help

CONFIG=-f docker/docker-compose.yml

build: ## Force rebuild container
	@docker build -t dht22 -f docker/Dockerfile .

up: ## Creates and starts the docker containers
	@docker-compose $(CONFIG) up -d
	@docker-compose $(CONFIG) ps

down: ## Stops and removes the docker containers
	@docker-compose $(CONFIG) down

logs: ## Logs
	@docker-compose $(CONFIG) logs

run: ## Get values from dht22
	@docker-compose $(CONFIG) run dht22 ./dht22

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
