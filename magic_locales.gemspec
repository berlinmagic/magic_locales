$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "magic_locales/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "magic_locales"
  s.version     = MagicLocales::VERSION
  s.authors     = ["Torsten Wetzel"]
  s.email       = ["twetzel@berlinmagic.com"]
  s.homepage    = "https://github.com/berlinmagic/magic_locales"
  s.summary     = "Rails gem to help with common european locales."
  s.description = "Rails gem to help with translations and locale changing. Uses simple locale style like `en` or `de` .. more complex (`en-US`) style may follow. "
  s.license     = "MIT"

  s.files       = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.test_files  = Dir["spec/**/*"]

  s.add_dependency              "rails",          ">= 4.2"
  s.add_dependency              "railties",       ">= 4.2"
  s.add_dependency              "globalize",      ">= 5.0"
  s.add_dependency              "micromachine",   ">= 1.1"

  s.add_development_dependency  "sqlite3"
  s.add_development_dependency  "rspec-rails"

end
