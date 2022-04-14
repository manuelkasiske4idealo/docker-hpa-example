REGISTRY?=manuelkasiske
IMAGE?=$(REGISTRY)/docker-hpa-example
build:
	docker build -t $(IMAGE) .
push:
	docker push $(IMAGE)
all: build push
