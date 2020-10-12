SERVICE_NAME = phpmyadmin

build:
	docker build -t $(SERVICE_NAME) .

run:
	docker run --name $(SERVICE_NAME) -it -p 5000:5000 -d $(SERVICE_NAME):latest

exec:
	docker exec -it $(SERVICE_NAME) sh

rm:
	docker stop $(SERVICE_NAME) && docker rm $(SERVICE_NAME)

.PHONY: build run exec rm