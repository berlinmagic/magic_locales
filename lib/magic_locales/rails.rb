require 'magic_locales'
require 'rails'

module MagicLocales
  class Engine < ::Rails::Engine
    
    initializer "magic_locales.view_helpers" do
      ActionView::Base.send :include, FlagHelper
      #Sprockets.append_path( "../../vendor/assets" )
      Rails.application.config.assets.precompile += %w( flags/*.* )
    end
    
  end
end