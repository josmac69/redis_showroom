ifdef_check = $(if $(SCRIPT),,@echo "SCRIPT variable is not set or empty"; exit 1)

.PHONY: create-env \
	create-network \
	build-python \
	start-redis \
	redis-cli \
	run-python \
	stop-all

NETWORK_NAME = redis_showroom
PYTHON_IMAGE = python_redis_showroom

build-python:
	docker build --progress=plain --no-cache -t "$(PYTHON_IMAGE)" -f Dockerfile.python .

create-env:
	mkdir -p ./redis_data
	mkdir -p ./secrets
	mkdir -p ./data_inputs
	mkdir -p ./data_outputs

create-network: create-env
	docker network inspect $(NETWORK_NAME) >/dev/null 2>&1 || docker network create $(NETWORK_NAME)

start-redis: create-network
	docker run -d \
	--network $(NETWORK_NAME) \
	--name redis-stack \
	-v "${PWD}/redis_data":/data \
	-p 6379:6379 \
	-p 8001:8001 \
	redis/redis-stack:latest

redis-cli:
	docker exec -it redis-stack redis-cli

run-python: create-network
	$(call ifdef_check)
	docker run -it --rm \
	--net $(NETWORK_NAME) \
	-v "${PWD}/data_inputs/":"/inputs" \
	-v "${PWD}/data_outputs/":"/outputs" \
	-v "${PWD}/secrets":/secrets \
	-v "${PWD}/$(SCRIPT)":/app \
	"$(PYTHON_IMAGE)"

stop-all:
	docker ps -aq | xargs -L1 docker rm -f
