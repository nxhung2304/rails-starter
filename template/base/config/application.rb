require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module __APP_MODULE__
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks generators templates])

    config.generators do |g|
      g.test_framework  :test_unit, fixture: false
      g.fixture_replacement :factory_bot, dir: "test/factories"
    end
  end
end
