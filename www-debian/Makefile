PROJECT_NAME = pm_www_debian

DOCKER_COMPOSE = docker-compose -p $(PROJECT_NAME)
DOCKER = docker

.PHONY: all
all: up

.PHONY: up
up:
	@$(DOCKER_COMPOSE) up -d


.PHONY: down
down:
	@$(DOCKER_COMPOSE) down --remove-orphans


.PHONY: clean
clean: down clean-containers clean-images clean-volumes

.PHONY: stop
stop:
	@$(DOCKER_COMPOSE) stop

.PHONY: clean-containers
clean-containers:
	@$(DOCKER_COMPOSE) rm -f

.PHONY: clean-images
clean-images:
	@$(DOCKER) images -q --filter "label=com.docker.compose.project=$(PROJECT_NAME)" | xargs -r $(DOCKER) rmi -f


.PHONY: clean-volumes
clean-volumes:
	@$(DOCKER_COMPOSE) down -v
