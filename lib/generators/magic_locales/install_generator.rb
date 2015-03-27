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
      
      def create_seeds_folder
        empty_directory( "db/seeds" )
      end
      
      desc "add country-seed file"
      def copy_country_seeds
        copy_file( "locale_seeds.rb", "db/seeds/locales.rb" )
      end
      
      # => desc "add magic_addresses initialitzer"
      # => def copy_mgca_initialitzer
      # =>   copy_file( "magic_initializer.rb", "config/initializers/magic_addresses.rb" )
      # => end
      
# =>       desc "add magic_addresses routes"
# =>       def copy_mgca_routes
# =>         route <<-ROUTE
# => 
# =>   scope :mgca, module: :magic_addresses do
# =>     resources :countries, only: :index
# =>     resources :states, only: :index
# =>     resources :cities, only: :index
# =>     resources :districts, only: :index
# =>     resources :subdistricts, only: :index
# =>     get "/" => "countries#index"
# =>   end
# => 
# =>         ROUTE
# =>       end
      
      
      
      
    end
  end
end