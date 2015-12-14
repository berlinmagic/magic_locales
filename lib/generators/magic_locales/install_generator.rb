require 'rails/generators/migration'

module MagicLocales
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)


      desc "add magic_locales migrations"
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template( "magic_logales_migration.rb", "db/migrate/add_magic_locales.rb" )
      end
      
      # => def create_seeds_folder
      # =>   empty_directory( "db/seeds" )
      # => end
      
      desc "add locale-seed file"
      def copy_country_seeds
        copy_file( "locale_seeds.rb", "db/seed_locales.rb" )
      end
      
      desc "add magic_logales initialitzer"
      def copy_mgca_initialitzer
        copy_file( "magic_initializer.rb", "config/initializers/magic_logales.rb" )
      end
      
      desc "add magic_locales routes"
      def copy_mgca_routes
        route <<-ROUTE

  scope :mgclang, module: :magic_locales do
    resources :locales do
      get "trigger/:state", action: :trigger, on: :member, as: :trigger
    end
    get "/" => "locales#index"
  end
  get "/change-locale/:locale", controller: "magic_locales/locales", action: :change_locale, as: :change_locale

        ROUTE
      end
      
      
      
      
    end
  end
end