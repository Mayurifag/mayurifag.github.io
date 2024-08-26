.PHONY: build up down down-all restart reprovision log

build:
	docker-compose build

up: build
	docker-compose up --detach

down:
	docker-compose down --remove-orphans

down-all:
	docker-compose down --volumes --remove-orphans --rmi all

restart:
	docker-compose restart $(ARGS)

reprovision: down up

# -> make log [SERVICE] (i.e. make log app)
log:
	docker-compose logs -f $(ARGS)
