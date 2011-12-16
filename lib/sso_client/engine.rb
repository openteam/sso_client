require 'devise'
require 'configliere'

module SsoClient
  class Engine < Rails::Engine

    def self.root_path
      @root_path ||= File.expand_path("../../../", __FILE__)
    end

    isolate_namespace SsoClient

    config.after_initialize do
      Settings.resolve!
    end

    initializer "sso_client.devise", :before => 'devise.omniauth' do |app|
      require "#{SsoClient::Engine.root_path}/lib/omniauth-identity/omniauth/strategies/identity"

      Settings.define 'sso.url',    :env_var => 'SSO_URL',    :required => true
      Settings.define 'sso.key',    :env_var => 'SSO_KEY',    :required => true
      Settings.define 'sso.secret', :env_var => 'SSO_SECRET', :required => true

      Devise.setup do |config|
        config.omniauth :identity,
                        Settings['sso.key'],
                        Settings['sso.secret'],
                        :client_options => {:site => Settings['sso.url']}
      end
    end

  end
end
