.PHONY: help setup dev test lint security audit

help:
	@printf "Available targets:\n"
	@printf "  make setup     # Install gems and prepare the database\n"
	@printf "  make dev       # Start the development server\n"
	@printf "  make test      # Run the test suite\n"
	@printf "  make lint      # Run RuboCop\n"
	@printf "  make security  # Run Brakeman\n"
	@printf "  make audit     # Run bundler-audit\n"

setup:
	@bin/setup

dev:
	@bin/dev

test:
	@bin/rails test

lint:
	@bin/rubocop

security:
	@bin/brakeman --no-pager

audit:
	@bin/bundler-audit
