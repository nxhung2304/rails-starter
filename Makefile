.PHONY: help bootstrap setup dev

help:
	@printf "Available targets:\n"
	@printf "  make bootstrap  # Choose and materialize a starter profile\n"
	@printf "  make setup      # Run generated app setup after bootstrap\n"
	@printf "  make dev        # Run generated app server after bootstrap\n"

bootstrap:
	@bin/bootstrap_app

setup:
	@bin/setup

dev:
	@bin/dev
