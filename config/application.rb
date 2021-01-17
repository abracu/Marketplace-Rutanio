require_relative 'boot'

require 'rails/all'
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rutanio
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('my','locales','*{rb, yml}').to_s]
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('/app/assets/fonts')
    
    config.before_configuration do
       env_file = File.join(Rails.root, 'config', 'local_env.yml')
       YAML.load(File.open(env_file)).each do |key, value|
         ENV[key.to_s] = value
       end if File.exists?(env_file)
     end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
