require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module TestInstagramclone
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.load_defaults 5.2
    config.generatours do |g|

      g.assets false
      g.helper false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
