# PHONY goal dynamically
.PHONY: $(MAKECMDGOALS)

ISO2TAR_CMD = $(shell pwd)/iso2tar.sh

ifeq ($(MAKECMDGOALS), login)

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
	@echo "  mini       Build and push CRUX mini image"
	@echo "  updated    Build and push CRUX updated image"
	@echo "  all        Build and push all images"
	@echo "  login      Authenticate into your registry"
	@echo
	@echo "Where the `login` sub-command requires to provide these variables:"
	@echo "  DOCKER_USERNAME and DOCKER_PASSWORD"
	@echo "Examples:"
	@echo "  DOCKER_USER=myuser DOCKER_PASS=mypass make login"
	@echo "  make login DOCKER_USER=myuser DOCKER_PASS=mypass"

all: image-setup image-latest image-mini image-updated

login:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD) docker.io

3.7-setup: $(ISO2TAR_CMD)
	cd 3.7-setup && \
		wget -q http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-3.7/iso/crux-3.7.iso && \
		sudo $(ISO2TAR_CMD) crux-3.7.iso && \
		docker build -t sepen/crux:3.7-setup .
		docker push sepen/crux:3.7-setup

setup: 3.7-setup
	docker tag sepen/crux:3.7-setup sepen/crux:setup
	docker push sepen/crux:setup
