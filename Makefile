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


init: submodule-add pull build build-dev
build: build-base build-dev

submodule-add:
	if [ ! -d "vendor/odoo/ce/" ]; then git submodule add --force -b $(ODOO_VERSION) https://github.com/odoo/odoo.git vendor/odoo/ce/ ; fi

### Pulling images
pull:
	docker pull --platform $(PLATFORM) $(FROM):$(FROM_VERSION)

### Building images
build-base:
	docker build --platform $(PLATFORM) --tag $(IMAGE):$(ODOO_VERSION) --build-arg "FROM_IMAGE=$(FROM):$(FROM_VERSION)" .

build-dev:
	docker build --platform $(PLATFORM) -f dev-tools/Dockerfile --tag $(IMAGE):$(ODOO_VERSION)-dev --build-arg "FROM_IMAGE=$(IMAGE):$(ODOO_VERSION)" .
