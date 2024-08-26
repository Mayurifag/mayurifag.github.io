.PHONY: docker-build docker-run docker-push

docker-build:
	docker build -t mayurifag/mayurifag.github.io:latest .

docker-run: docker-build
	docker run -p 8005:80 mayurifag/mayurifag.github.io:latest

docker-push:
	docker push mayurifag/mayurifag.github.io:latest
