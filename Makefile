
.PHONY: create-env \
	create-network \
	start-redis \
	redis-cli \
	stop-all

NETWORK_NAME = redis_showroom

create-env:
	mkdir -p ./redis_data

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

stop-all:
	docker ps -aq | xargs -L1 docker rm -f
