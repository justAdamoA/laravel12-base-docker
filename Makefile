default: help
help: ## show help
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\):.*##[ \t]*/    \1 ## /' | sort | column -t -s '##'

build: ## build the docker containers
	@docker compose build

u: up
up: ## start the @docker containers
up: build
	@docker compose up -d

d: down
down: ## stop the docker containers
	@docker compose down

r: restart
restart: ## restarts the web and worker (to pick up changes is .env)
	@docker compose restart

s: start
start: ## start docker and migrate
start: up

stop: ## stop the docker containers
stop: down

w: start-workers
start-workers: ## start laravel workers
	@docker compose exec web php artisan queue:listen --tries=1

c: console
console: ## starts a shell
	@docker compose exec web bash

l: logs
logs: ## show docker containers logs
	@docker compose logs --follow

up-dev: ## start the docker environment and laravel dev
up-dev: up start-dev

start-dev: ## start the dev environment
	@docker compose exec web composer run dev

m: migrate
migrate: ## migrate db
	@docker compose exec web php artisan migrate

build-fe: ## build the frontend
	@docker compose exec web npm run build

i: install
install: ## install dependencies
install: install-php install-js
	
install-php: ## install php dependencies
	@docker compose exec web composer install --prefer-dist --no-interaction

install-js: ## install js dependencies
	@docker compose exec web npm install

update: ## update dependencies
update: update-php install-js

update-php: ## update php dependencies
	@docker compose exec web composer update

generate-key:
	@docker compose exec web php artisan key:generate

dotenv: ## create .env from .env.example if doesnt exist
dotenv:
	cp -n .env.example .env | true

first-run: ## setup and run laravel for the first time
first-run: dotenv up install generate-key migrate start-dev
