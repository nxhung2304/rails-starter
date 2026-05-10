.PHONY: help new bootstrap setup dev

help:
	@printf "Available targets:\n"
	@printf "  make new APP=<name>  # Create a new app from this template (preferred)\n"
	@printf "  make bootstrap       # Bootstrap a profile into this repo (in-place)\n"
	@printf "  make setup           # Install gems and prepare the database\n"
	@printf "  make dev             # Start the development server\n"

new:
	@ruby bin/new $(APP)

bootstrap:
	@bin/bootstrap_app

setup:
	@bin/setup

dev:
	@bin/dev
