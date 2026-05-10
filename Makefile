.PHONY: help new bootstrap setup dev test test-no-browser

help:
	@printf "Available targets:\n"
	@printf "  make new APP=<name>  # Create a new app from this template (preferred)\n"
	@printf "  make bootstrap       # Bootstrap a profile into this repo (in-place)\n"
	@printf "  make setup           # Install gems and prepare the database\n"
	@printf "  make dev             # Start the development server\n"
	@printf "  make test            # Generate all 3 profiles and run tests + rubocop + browser\n"
	@printf "  make test-no-browser # Same but skip browser (system) tests\n"

new:
	@ruby bin/new $(APP)

bootstrap:
	@bin/bootstrap_app

setup:
	@bin/setup

dev:
	@bin/dev

test:
	@ruby bin/test_profiles

test-no-browser:
	@ruby bin/test_profiles --no-browser
