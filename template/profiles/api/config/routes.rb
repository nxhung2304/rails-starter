Rails.application.routes.draw do
  mount API::Base => "/"
  mount GrapeSwaggerRails::Engine => "/docs" if ENV["SWAGGER_ENABLED"] == "true"
  get "up" => "rails/health#show", as: :rails_health_check
end
