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
	@echo "Where some targets are:"
	@echo "  setup           Build and push CRUX setup image"
	@echo "  latest          Build and push CRUX latest image"
	@echo "  slim            Build and push CRUX slim image"
	@echo "  updated-setup   Build and push CRUX updated-setup image"
	@echo "  updated         Build and push CRUX updated image"
	@echo "  updated-slim    Build and push CRUX updated-slim image"
	@echo "  all             Build and push all images"
	@echo "  login           Authenticate into your registry"
	@echo
	@echo "Where login requires to provide these extra variables:"
	@echo "  DOCKER_USERNAME and DOCKER_PASSWORD"
	@echo

all: setup latest slim update-setup updated updated-slim arm64 armhf

login:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD) docker.io

3.7-setup: $(ISO2TAR_CMD)
	cd 3.7-setup && \
		wget --no-verbose --continue http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-3.7/iso/crux-3.7.iso && \
		sudo $(ISO2TAR_CMD) crux-3.7.iso && \
		docker build -t sepen/crux:3.7-setup . && \
		docker push sepen/crux:3.7-setup

setup: 3.7-setup
	docker tag sepen/crux:3.7-setup sepen/crux:setup
	docker push sepen/crux:setup

3.7:
	cd 3.7 && \
		docker build -t sepen/crux:3.7 . && \
		docker push sepen/crux:3.7

latest: 3.7
	docker tag sepen/crux:3.7 sepen/crux:latest
	docker push sepen/crux:latest

3.7-slim:
	cd 3.7-slim && \
		docker build -t sepen/crux:3.7-slim . && \
		docker push sepen/crux:3.7-slim

slim: 3.7-slim
	docker tag sepen/crux:3.7-slim sepen/crux:slim
	docker push sepen/crux:slim

3.7-updated-setup: $(ISO2TAR_CMD)
	cd 3.7-updated-setup && \
		wget --no-verbose --continue https://crux.ninja/updated-iso/crux-3.7-updated.iso && \
		sudo $(ISO2TAR_CMD) crux-3.7-updated.iso && \
		docker build -t sepen/crux:3.7-updated-setup . && \
		docker push sepen/crux:3.7-updated-setup

updated-setup: 3.7-updated-setup
	docker tag sepen/crux:3.7-updated-setup sepen/crux:updated-setup
	docker push sepen/crux:updated-setup

3.7-updated:
	cd 3.7-updated && \
		docker build -t sepen/crux:3.7-updated . && \
		docker push sepen/crux:3.7-updated

updated: 3.7-updated
	docker tag sepen/crux:3.7-updated sepen/crux:updated
	docker push sepen/crux:updated

3.7-updated-slim:
	cd 3.7-updated-slim && \
		docker build -t sepen/crux:3.7-updated-slim . && \
		docker push sepen/crux:3.7-updated-slim

updated-slim: 3.7-updated-slim
	docker tag sepen/crux:3.7-updated-slim sepen/crux:updated-slim
	docker push sepen/crux:updated-slim


# arm64

3.7-arm64/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz:
	cd 3.7-arm64 && \
		curl -SL -O https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz

3.7-arm64: 3.7-arm64/Dockerfile 3.7-arm64/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz
	cd 3.7-arm64 && \
		docker build -t sepen/crux:3.7-arm64 . && \
		docker push sepen/crux:3.7-arm64

arm64: 3.7-arm64
	docker tag sepen/crux:3.7-arm64 sepen/crux:arm64
	docker push sepen/crux:arm64


# armhf

3.7-armhf/crux-arm-3.7-rc4.rootfs.tar.xz:
	cd 3.7-armhf && \
		curl -SL -O https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-rc4.rootfs.tar.xz

3.7-armhf: 3.7-armhf/Dockerfile 3.7-armhf/crux-arm-3.7-rc4.rootfs.tar.xz
	cd 3.7-armhf && \
		docker build -t sepen/crux:3.7-armhf . && \
		docker push sepen/crux:3.7-armhf

armhf: 3.7-armhf
	docker tag sepen/crux:3.7-armhf sepen/crux:armhf
	docker push sepen/crux:armhf


#
# legacy 2.6
#

2.6-setup: $(ISO2TAR_CMD)
	cd 2.6-setup && \
		wget --no-verbose --continue http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.6/iso/crux-2.6.iso && \
		sudo $(ISO2TAR_CMD) crux-2.6.iso && \
		mkdir tmp && \
		tar -C tmp -xf crux-2.6.tar && \
		tmp/tools/unsquashfs -d rootfs tmp/crux.squashfs 2>/dev/null && \
		cd rootfs && tar cf ../rootfs-2.6.tar * && cd .. && \
		rm -r tmp rootfs && \
		docker build -t sepen/crux:2.6-setup . && \
		docker push sepen/crux:2.6-setup

2.6:
	cd 2.6 && \
		docker build -t sepen/crux:2.6 .
		docker push sepen/crux:2.6

