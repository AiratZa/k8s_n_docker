SERVICE_NAME = nginx

build:
	docker build -t $(SERVICE_NAME) .

run:
	docker run --name $(SERVICE_NAME) -p 80:80 -p 443:443 -it -d $(SERVICE_NAME):latest

exec:
	docker exec -it $(SERVICE_NAME) bash

rm:
	docker stop $(SERVICE_NAME) && docker rm $(SERVICE_NAME)

.PHONY: build run exec rm