DC ?= docker-compose -f docker-compose.yaml -f docker-compose.ssh-key.yaml
DC_RUN ?= $(DC) run
DC_EXEC ?= $(DC) exec

BACKEND_RUN ?= $(DC_RUN) backend
FRONTEND_RUN ?= $(DC_RUN) frontend

GIT_CLONE ?= git clone git@github.com:rootsher
BRANCH_BACKEND ?= master
BRANCH_FRONTEND ?= master

default: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk '{split($$0, a, ":"); printf "\033[36m%-30s\033[0m %-30s %s\n", a[1], a[2], a[3]}'

up: ## to run docker-compose up -d
	$(DC) up -d

down: ## to run docker-compose down
	$(DC) down

docker-compose: ## to run docker-compose command e.g. make docker-compose COMMAND=ps
	$(DC) $(COMMAND)

update-backend: ## to only update backend (git, npm)
	bin/command/repository-update backend $(BRANCH_BACKEND)
	make setup-backend

update-frontend: ## to only update frontend (git, npm)
	bin/command/repository-update frontend $(BRANCH_FRONTEND)
	make setup-frontend

setup-backend: ## to setup only backend repository
	$(BACKEND_RUN) npm install

setup-frontend: ## to setup only frontend repository
	$(FRONTEND_RUN) npm install

database-migrate: ## to only run migrations
	$(BACKEND_RUN) npm run migration:run

setup: ## to setup project
	test -e .env || cp .env.dist .env
	test -e repositories/backend || $(GIT_CLONE)/boilerplate-backend.git repositories/backend
	test -e repositories/frontend || $(GIT_CLONE)/boilerplate-frontend.git repositories/frontend

	make setup-backend
	make setup-frontend

	make up

	#TODO: wait for frontend and backend http server to be ready
