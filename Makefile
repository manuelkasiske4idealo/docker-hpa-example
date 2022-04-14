build:
	docker build -t manuelkasiske/docker-hpa-example .
push:
	docker push manuelkasiske/docker-hpa-example
all: build push
