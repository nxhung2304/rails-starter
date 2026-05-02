# Rails Starter

`rails-starter` is a template source repository for bootstrapping new Rails apps.

## Profiles

- `api`: Rails API-only app using Grape, Swagger, and Grape Entity
- `web`: Rails web app with Turbo, Stimulus, Tailwind, and Pagy
- `web_auth`: `web` plus Devise-based `User` authentication

## Usage

1. Clone this repository.
2. Run `make bootstrap` or `bin/bootstrap_app`.
3. Choose a profile.
4. Run `make setup`.
5. Start the app with `make dev`.

`bin/bootstrap_app` only materializes the selected profile into the repository root. It does not install gems or prepare the database.

## Common Commands

- `make bootstrap`
- `make setup`
- `make dev`

## Layout

- `template/base`: shared files copied into every generated app
- `template/profiles/api`: Grape API overlay
- `template/profiles/web`: Hotwire web overlay
- `template/profiles/web_auth`: Devise overlay applied after `web`

Each profile ships with a complete `Gemfile`. The bootstrap script copies files; it does not try to merge dependencies.
