all: build

build:
	@docker build --tag=${USER}/php7.0-fpm .
