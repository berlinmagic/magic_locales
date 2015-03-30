# require "magic_locales/configuration"

require "app/models/magic_locales/association"
require "app/models/magic_locales"

# require "helpers/mgca_helper"

# require "magic_addresses/railtie" if defined?(Rails::Railtie)
require "magic_locales/rails" if defined?(Rails)

require "magic_locales/magic_locale_helper"


module MagicLocales
  
  # models
  autoload :Language,       "app/models/magic_locales/language"
  autoload :Locale,         "app/models/magic_locales/locale"
  
  ### configuration
  # => class << self
  # =>   attr_accessor :configuration
  # =>   # Call this method to modify defaults in your initailizers.
  # =>   #   MagicAddresses.configure do |config|
  # =>   #     config.active_locales << :fr
  # =>   #   end
  # =>   def configure
  # =>     self.configuration ||= Configuration.new
  # =>     yield(configuration)
  # =>   end
  # => end
  
end

ActiveSupport.on_load(:active_record) do
  require 'globalize'
end

ActiveRecord::Base.send :include, MagicLocales::Association

