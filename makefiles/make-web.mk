rspec:
	docker-compose run --rm web rspec $(ARGS)

.PHONY: middleman
middleman:
	docker-compose run --rm web middleman $(ARGS)

bundle:
	docker-compose run --rm web bundle $(ARGS)

be:
	docker-compose run --rm web bundle exec $(ARGS)

sh:
	docker-compose run --rm web sh

rubocop:
	docker-compose run --rm web bundle exec standardrb --fix $(ARGS)

rweb:
	docker-compose restart web

npm:
	docker-compose run --rm web npm $(ARGS)

stylelint:
	docker-compose run --rm web npx stylelint --fix "source/**/*.scss"
