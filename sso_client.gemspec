$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sso_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sso_client"
  s.version     = SsoClient::VERSION
  s.authors     = ["Dmitry Lihachev"]
  s.email       = ["lda@openteam.ru"]
  s.homepage    = "http://github.com/openteam/sso_client"
  s.summary     = "Client gem for connecting to SSO server"
  s.description = "Client gem for connecting to SSO server (http://github.com/openteam/sso_server)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "configliere"
  s.add_dependency "devise"
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-oauth2'

  s.add_development_dependency 'fabrication'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'libnotify'
  s.add_development_dependency 'rb-inotify'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'sqlite3'
end
