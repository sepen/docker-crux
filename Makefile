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
	@echo "Usage: make <target>"
	@echo
	@echo "Where targets are:"
	@echo "  setup           Build and push CRUX setup image"
	@echo "  latest          Build and push CRUX latest image"
	@echo "  slim            Build and push CRUX slim image"
	@echo "  updated-setup   Build and push CRUX updated-setup image"
	@echo "  updated         Build and push CRUX updated image"
	@echo "  updated-slim    Build and push CRUX updated-slim image"
	@echo "  all             Build and push all images"
	@echo "  login           Authenticate into your registry"
	@echo
	@echo "Where the `login` sub-command requires to provide these variables:"
	@echo "  DOCKER_USERNAME and DOCKER_PASSWORD"
	@echo "Examples:"
	@echo "  DOCKER_USER=myuser DOCKER_PASS=mypass make login"
	@echo "  make login DOCKER_USER=myuser DOCKER_PASS=mypass"

all: setup latest slim update-setup updated updated-slim

login:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD) docker.io

3.7-setup: $(ISO2TAR_CMD)
	cd 3.7-setup && \
		wget --no-verbose --continue http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-3.7/iso/crux-3.7.iso && \
		sudo $(ISO2TAR_CMD) crux-3.7.iso && \
		docker build -t sepen/crux:3.7-setup .
		docker push sepen/crux:3.7-setup

setup: 3.7-setup
	docker tag sepen/crux:3.7-setup sepen/crux:setup
	docker push sepen/crux:setup

3.7:
	cd 3.7 && \
		docker build -t sepen/crux:3.7 .
		docker push sepen/crux:3.7

latest: 3.7
	docker tag sepen/crux:3.7 sepen/crux:latest
	docker push sepen/crux:latest

3.7-slim:
	cd 3.7-slim && \
		docker build -t sepen/crux:3.7-slim .
		docker push sepen/crux:3.7-slim

slim: 3.7-slim
	docker tag sepen/crux:3.7-slim sepen/crux:slim
	docker push sepen/crux:slim

3.7-updated-setup: $(ISO2TAR_CMD)
	cd 3.7-updated-setup && \
		wget --no-verbose --continue https://crux.ninja/updated-iso/crux-3.7.iso && \
		sudo $(ISO2TAR_CMD) crux-3.7.iso && \
		docker build -t sepen/crux:3.7-updated-setup .
		docker push sepen/crux:3.7-updated-setup

updated-setup: 3.7-updated-setup
	docker tag sepen/crux:3.7-updated-setup sepen/crux:updated-setup
	docker push sepen/crux:updated-setup

3.7-updated:
	cd 3.7-updated && \
		docker build -t sepen/crux:3.7-updated .
		docker push sepen/crux:3.7-updated

updated: 3.7-updated
	docker tag sepen/crux:3.7-updated sepen/crux:updated
	docker push sepen/crux:updated

3.7-updated-slim:
	cd 3.7-updated-slim && \
		docker build -t sepen/crux:3.7-updated-slim .
		docker push sepen/crux:3.7-updated-slim

updated-slim: 3.7-updated-slim
	docker tag sepen/crux:3.7-updated-slim sepen/crux:updated-slim
	docker push sepen/crux:updated-slim





