.PHONY: help
help: ## Help
	@awk 'BEGIN {FS = ":.?## "} /^[a-zA-Z_-]+:.?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

null:
	help

.PHONY: build
build: ## Build docker container local
	docker build -t kittens-store -f Dockerfile .

.PHONY: start
start: ## Start local environment
	docker-compose up -d

.PHONY: stop
stio: ## Stio local environment
	docker-compose down

.PHONY: bash
bash: ## ssh ruby app
	docker-compose exec app /bin/bash

.PHONY: logs-app
logs-app: ## ssh ruby logs
	docker-compose logs app

.PHONY: logs-db
logs-db: ## ssh db logs
	docker-compose logs db