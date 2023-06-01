# PHONY goal dynamically
.PHONY: $(MAKECMDGOALS)

ifneq ($(MAKECMDGOALS), help)

ifndef DOCKER_USERNAME
$(error "You must set DOCKER_USERNAME. Type `make help` for more info.")
endif
export DOCKER_USERNAME

ifndef DOCKER_PASSWORD
$(error "You must set DOCKER_PASSWORD. Type `make help` for more info.")
endif
export DOCKER_PASSWORD

endif

help:
	@echo "Usage: make <sub-command>"
	@echo
	@echo "Where sub-commands are:"
	@echo "  latest     Build and push CRUX latest image"
	@echo "  mini       Build and push CRUX minimal image"
	@echo "  all        Build and push all images"
	@echo "  login      Authenticate into your registry"
	@echo
	@echo "Where the `login` sub-command requires to provide these variables:"
	@echo "  DOCKER_USERNAME and DOCKER_PASSWORD"
	@echo "Examples:"
	@echo "  DOCKER_USER=myuser DOCKER_PASS=mypass make login"
	@echo "  make login DOCKER_USER=myuser DOCKER_PASS=mypass"

all: latest mini

login:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD) docker.io

latest:
	# 3.7
	docker build -t sepen/crux:3.7 -f 3.7/Dockerfile .
	docker push sepen/crux:3.7
	# latest
	docker tag sepen/crux:3.7 sepen/crux:latest
	docker push sepen/crux:latest

mini:
	# 3.7-mini
	docker build -t sepen/crux:3.7-mini -f 3.7-mini/Dockerfile .
	docker push sepen/crux:3.7-mini
	# mini
	docker tag sepen/crux:3.7-mini sepen/crux:mini
	docker push sepen/crux:mini
