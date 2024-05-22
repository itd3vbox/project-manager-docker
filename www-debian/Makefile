# Nom du projet
PROJECT_NAME = pm_www_debian

# Définition des commandes Docker
DOCKER_COMPOSE = docker-compose -p $(PROJECT_NAME)
DOCKER = docker

# Cibles par défaut
.PHONY: all
all: up

# Cible pour démarrer les services Docker
.PHONY: up
up:
	@$(DOCKER_COMPOSE) up -d

# Cible pour arrêter et supprimer les services Docker
.PHONY: down
down:
	@$(DOCKER_COMPOSE) down --remove-orphans

# Cible pour nettoyer les volumes, conteneurs, et images Docker du projet spécifique
.PHONY: clean
clean: down clean-containers clean-images clean-volumes

# Cible pour arrêter les conteneurs du projet spécifique
.PHONY: stop
stop:
	@$(DOCKER_COMPOSE) stop

# Cible pour supprimer les conteneurs du projet spécifique
.PHONY: clean-containers
clean-containers:
	@$(DOCKER_COMPOSE) rm -f

# Cible pour supprimer les images Docker associées au projet
.PHONY: clean-images
clean-images:
	@$(DOCKER) images -q --filter "label=com.docker.compose.project=$(PROJECT_NAME)" | xargs -r $(DOCKER) rmi -f

# Cible pour supprimer les volumes Docker du projet spécifique
.PHONY: clean-volumes
clean-volumes:
	@$(DOCKER_COMPOSE) down -v
