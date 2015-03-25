$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "magic_locales/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "magic_locales"
  s.version     = MagicLocales::VERSION
  s.authors     = ["Torsten Wetzel"]
  s.email       = ["torsten@orderlift.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MagicLocales."
  s.description = "TODO: Description of MagicLocales."
  s.license     = "MIT"

  s.files       = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files  = Dir["spec/**/*"]

  s.add_dependency              "rails",        ">= 4.2"
  s.add_dependency              "railties",     ">= 4.2"

  s.add_development_dependency  "sqlite3"
  s.add_development_dependency  "rspec-rails"
end
