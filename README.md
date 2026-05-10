# Rails Starter

A permanent template tool for bootstrapping new Rails apps. Keep it in one place and use it to generate as many projects as you need.

## Profiles

| Profile | Stack |
|---|---|
| `api` | Rails API-only · Grape · Swagger · Grape Entity · Sidekiq · CanCanCan · Rolify · PaperTrail |
| `web` | Rails web · Turbo · Stimulus · Tailwind · DaisyUI · SimpleForm · Sidekiq · PaperTrail |
| `web_auth` | `web` + Devise · Google OAuth2 · CanCanCan · Rolify |

## Setup (one time)

Clone `rails-starter` once to a permanent location:

```bash
git clone https://github.com/nxhung2304/rails-starter ~/Dev/personal/rails-starter
```

## Creating a New Project

**Option 1 — from rails-starter directly**

```bash
cd ~/Dev/personal/rails-starter
make new APP=~/Dev/personal/todo-api
# or: ruby bin/new ~/Dev/personal/todo-api
```

**Option 2 — from anywhere using the script**

```bash
cd ~/Dev/personal
ruby ~/Dev/personal/rails-starter/bin/new todo-api
```

**Option 3 — via curl (clones rails-starter automatically if not present)**

```bash
curl -fsSL https://raw.githubusercontent.com/nxhung2304/rails-starter/main/install.sh | bash -s todo-api ~/Dev/personal
```

All three approaches ask you to pick a profile:

```
Choose a profile:
  1. api
  2. web
  3. web_auth
> 1

Creating todo-api (profile: api)...
Done.

Next steps:
  cd ~/Dev/personal/todo-api
  cp .envrc.example .envrc && direnv allow
  bin/setup
  bin/dev
```

The app name is derived from the folder name (`todo-api` → module `TodoApi`, slug `todo_api`).

## First Run in the New Project

```bash
cd ~/Dev/personal/todo-api
cp .envrc.example .envrc    # fill in DATABASE_URL, REDIS_URL, etc.
direnv allow                # load env vars into your shell
bin/setup                   # bundle install + db:prepare
bin/dev                     # start server + sidekiq (+ tailwind for web profiles)
```

### Required env vars

**api / web**
```
export DATABASE_URL=postgres://localhost/todo_api_development
export REDIS_URL=redis://localhost:6379/0
```

**web_auth** (additional)
```
export GOOGLE_CLIENT_ID=
export GOOGLE_CLIENT_SECRET=
```

## Commands Inside the Generated Project

```bash
make setup     # bundle install + db:prepare
make dev       # start development server
make test      # run test suite
make lint      # run RuboCop
make security  # run Brakeman
make audit     # run bundler-audit
```

## Updating rails-starter

Since `rails-starter` is a permanent local tool, pull updates at any time:

```bash
cd ~/Dev/personal/rails-starter
git pull
```

Existing generated projects are not affected.
