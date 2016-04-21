$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aerospike_c_ruby_rails_cache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aerospike_c_ruby_rails_cache"
  s.version     = AerospikeCRubyRailsCache::VERSION
  s.authors     = ["Adam-Stomski"]
  s.email       = ["adam.stomski@gmail.com"]
  s.homepage    = "https://github.com/Adam-Stomski/aerospike_c_ruby_rails_cache"
  s.summary     = "Rails cache store with AerospikeCRuby"
  s.description = "Rails cache store with AerospikeCRuby"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "aerospike_c_ruby"
end
