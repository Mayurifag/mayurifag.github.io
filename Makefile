ARGS = $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

# include ./makefiles/*.mk

build:
	docker build .

up:
	docker-compose up --detach

down:
	docker-compose down --remove-orphans

down-all:
	docker-compose down --volumes --remove-orphans --rmi all

restart:
	docker-compose restart $(ARGS)

reprovision: down-all build up


# -> make log [SERVICE] (i.e. make log app)
.PHONY: log
log:
	docker-compose logs -f $(ARGS)
