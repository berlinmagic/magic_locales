require 'magic_locales'
require 'rails'

module MagicLocales
  class Railtie < Rails::Railtie
    
    # => initializer "my_gem.view_helpers" do
    # =>   ActionView::Base.send :include, MgcaHelper
    # =>   #Sprockets.append_path( "../../vendor/assets" )
    # =>   Rails.application.config.assets.precompile += %w( flags/*.* )
    # => end
    
  end
end