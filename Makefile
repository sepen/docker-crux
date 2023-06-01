# PHONY goal dynamically
.PHONE: $(MAKECMDGOALS)

help:
	@echo "Usage: make <latest|mini>"

all: latest mini

docker-login:
	docker login -u sepen docker.io

3.7: docker-login
	docker build -t sepen/crux:3.7 -f 3.7/Dockerfile
	docker push sepen/crux:3.7

latest: 3.7
	docker tag sepen/crux:3.7 sepen/crux:latest
	docker push sepen/crux:latest

3.7-mini: docker login
	docker build -t sepen/crux:3.7-mini -f 3.7-mini/Dockerfile .
	docker push sepen/crux:3.7-mini

mini: 3.7-mini
	docker tag sepen/crux:3.7-mini sepen/crux:mini
	docker push sepen/crux:mini
