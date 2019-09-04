$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'local_uri/version'

Gem::Specification.new do |s|
  s.name        = 'local_uri'
  s.version     = LocalUri::VERSION
  s.authors     = ['https://github.com/local-ch/local_uri/graphs/contributors']
  s.email       = ['web@localsearch.ch']
  s.homepage    = 'https://github.com/local-ch/local_uri'
  s.summary     = "Useful and slight extension to Ruby's URI (Uniform Resource Identifiers) core module."
  s.description = "Useful and slight extension to Ruby's URI (Uniform Resource Identifiers) core module."
  s.files       = Dir["{lib}/**/*", "README.md"]

  s.add_dependency 'activesupport'
  s.add_dependency 'rack'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'geminabox'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop', '~> 0.58.2'
  s.add_development_dependency 'rubocop-rspec', '~> 1.26.0'
end
