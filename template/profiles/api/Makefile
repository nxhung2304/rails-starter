.PHONY: help gen-api gen-model

NAME   ?=
FIELDS ?=

help:
	@printf "Generator targets:\n"
	@printf "  make gen-api   NAME=<resource>                   # Generate Grape API endpoint (e.g. NAME=posts)\n"
	@printf "  make gen-model NAME=<Model> [FIELDS=\"col:type\"]  # Generate model + migration  (e.g. NAME=Post FIELDS=\"title:string\")\n"

# ──────────────────────────────────────────────
# make gen-api NAME=posts
# ──────────────────────────────────────────────
gen-api:
	@[ -n "$(NAME)" ] || (printf "Usage: make gen-api NAME=<resource>\n"; exit 1)
	$(eval CLASS := $(shell echo "$(NAME)" | awk 'BEGIN{FS="_";OFS=""}{for(i=1;i<=NF;i++) $$i=toupper(substr($$i,1,1)) substr($$i,2); print}'))
	@mkdir -p app/grape/api/v1 app/entities
	@[ ! -f "app/grape/api/v1/$(NAME).rb" ] || (printf "ERROR: app/grape/api/v1/$(NAME).rb already exists\n"; exit 1)
	@printf '# frozen_string_literal: true\n\nmodule API\n  module V1\n    class $(CLASS) < Grape::API\n      resource :$(NAME) do\n        desc "List $(NAME)"\n        get do\n          # TODO: return collection\n        end\n\n        desc "Show $(NAME)"\n        params do\n          requires :id, type: Integer\n        end\n        get ":id" do\n          # TODO: return record\n        end\n\n        desc "Create $(NAME)"\n        params do\n          # requires :field, type: String\n        end\n        post do\n          # TODO: create record\n        end\n\n        desc "Update $(NAME)"\n        params do\n          requires :id, type: Integer\n          # optional :field, type: String\n        end\n        put ":id" do\n          # TODO: update record\n        end\n\n        desc "Delete $(NAME)"\n        params do\n          requires :id, type: Integer\n        end\n        delete ":id" do\n          # TODO: destroy record\n        end\n      end\n    end\n  end\nend\n' > app/grape/api/v1/$(NAME).rb
	@[ -f "app/entities/$(NAME)_entity.rb" ] || \
	  printf '# frozen_string_literal: true\n\nclass $(CLASS)Entity < BaseEntity\nend\n' \
	  > app/entities/$(NAME)_entity.rb
	@sed -i'' 's/mount API::V1::Health/mount API::V1::Health\n      mount API::V1::$(CLASS)/' \
	  app/grape/api/v1/base.rb
	@printf "Generated:\n"
	@printf "  app/grape/api/v1/$(NAME).rb\n"
	@printf "  app/entities/$(NAME)_entity.rb\n"
	@printf "  Mounted API::V1::$(CLASS) in app/grape/api/v1/base.rb\n"

# ──────────────────────────────────────────────
# make gen-model NAME=Post FIELDS="title:string body:text"
# ──────────────────────────────────────────────
gen-model:
	@[ -n "$(NAME)" ] || (printf "Usage: make gen-model NAME=<Model> [FIELDS=\"col:type ...\"]\n"; exit 1)
	@bin/rails generate model $(NAME) $(FIELDS)
