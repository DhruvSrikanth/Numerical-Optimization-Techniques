#!/usr/bin/make -f
SHELL = /bin/sh
.DELETE_ON_ERROR:

# Environment variables
PYTHON = python
PIP = pip
REMOVE = rm -rf
PRINT = @echo


# use regex to go through this Makefile and print help lines
# help lines is any comment starting with double '#' (see next comment). Prints alphabetical order.
## help :		print this help.
.PHONY: help
help: Makefile
	@echo "\n$(DESC)"
	@echo "\n	Generic commands"
	@sed -n 's/^## /		/p' $< | sort

# targets
## setup :		Setup the virtual environment.
.PHONY: setup

## install :		Install dependencies.
.PHONY: install

## update :		Update dependencies.
.PHONY: update

## adam :		Run and visualize the adam optimizer.
.PHONY: adam


# recipes
setup: create_env 
install: install_requirements
update: update_requirements
adam: adam_optimizer

# rules
create_env:
	$(PRINT) "Creating Virtual Environment..."
	$(PYTHON) -m venv ./.venv
	$(PRINT)

install_requirements:
	$(PRINT) "Installing Dependencies..."
	$(PIP) install -r ./requirements.txt
	$(PRINT) ""

update_requirements:
	$(PRINT) "Updating Dependencies..."
	$(PIP) freeze > ./requirements.txt
	$(PRINT) ""

adam_optimizer:
	$(PRINT) "Visualizing Adam Optimizer..."
	$(PYTHON) "./Conjugate Gradient/adam.py"
	$(PRINT)