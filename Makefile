DC ?= docker-compose -f docker-compose.yaml
DC_RUN ?= $(DC) run
DC_EXEC ?= $(DC) exec

FRONTEND_RUN ?= $(DC_RUN) frontend

GIT_CLONE ?= git clone git@github.com:rootsher
BRANCH_FRONTEND ?= master

default: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk '{split($$0, a, ":"); printf "\033[36m%-30s\033[0m %-30s %s\n", a[1], a[2], a[3]}'

run: ## to run docker-compose up -d
	$(DC) up -d

stop: ## to run docker-compose stop
	$(DC) stop

docker-compose: ## to run docker-compose command e.g. make docker-compose COMMAND=ps
	$(DC) $(COMMAND)

update-frontend: ## to only update frontend (git, npm)
	bin/command/repository-update frontend $(BRANCH_FRONTEND)
	make setup-frontend

setup-frontend: ## to setup only frontend repository
	$(DC_RUN) frontend npm install

setup: ## to setup project
	test -e .env || cp .env.dist .env
	test -e repositories/frontend || $(GIT_CLONE)/boilerplate-frontend.git repositories/frontend

	make setup-frontend

	make run
