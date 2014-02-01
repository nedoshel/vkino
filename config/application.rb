require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Vkino
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
  end
end
