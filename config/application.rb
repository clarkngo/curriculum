require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Curriculum
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

     # configure file generation for both application and specifications.
    config.generators do |g|
      g.helper          false
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec,
                        controller_specs: false,
                        fixture: false,
                        helper_specs: false,
                        routing_specs: false,
                        view_specs: false
      g.stylesheets     false
      g.javascripts     false
    end
  end
end
