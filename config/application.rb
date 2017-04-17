require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Attendance
  class Application < Rails::Application
    config.time_zone = 'Beijing'
  end
end
