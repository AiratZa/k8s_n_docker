SERVICE_NAME = ftps

build:
	docker build -t $(SERVICE_NAME) .

run:
	docker run --name $(SERVICE_NAME) -p 21:21 -p 2121:2121 -it -d $(SERVICE_NAME):latest

exec:
	docker exec -it $(SERVICE_NAME) sh

rm:
	docker stop $(SERVICE_NAME) && docker rm $(SERVICE_NAME)

.PHONY: build run exec rm