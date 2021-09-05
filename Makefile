current_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
### Load some important stuff

include .env
ccred=$(if $(filter $(OS),Windows_NT),,$(shell    echo "\033[31m"))
ccgreen=$(if $(filter $(OS),Windows_NT),,$(shell  echo "\033[32m"))
ccyellow=$(if $(filter $(OS),Windows_NT),,$(shell echo "\033[33m"))
ccbold=$(if $(filter $(OS),Windows_NT),,$(shell   echo "\033[1m"))
cculine=$(if $(filter $(OS),Windows_NT),,$(shell  echo "\033[4m"))
ccend=$(if $(filter $(OS),Windows_NT),,$(shell    echo "\033[0m"))

sleep := $(if $(filter $(OS),Windows_NT),timeout,sleep)

ifeq ($(OS),Windows_NT)
	# Docker for Windows takes care of the user mapping.
else
	ifndef COMPOSE_IMPERSONATION
		COMPOSE_IMPERSONATION="$(shell id -u):$(shell id -g)"
	endif
endif


init: pull build build-dev

### Pulling images
pull:
	docker pull $(FROM):$(FROM_VERSION)


### Building images
build:
	docker build --tag $(IMAGE):$(ODOO_VERSION) --build-arg "FROM_IMAGE=$(FROM):$(FROM_VERSION)" .

build-dev:
	docker build -f dev-tools/Dockerfile --tag $(IMAGE):$(ODOO_VERSION)-dev --build-arg "FROM_IMAGE=$(IMAGE):$(ODOO_VERSION)" .
