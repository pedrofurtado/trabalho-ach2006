require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrabalhoAch2006
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    config.i18n.locale = 'pt-BR'
    config.i18n.default_locale = 'pt-BR'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do
      DeviseController.layout 'devise'
    end
  end
end
