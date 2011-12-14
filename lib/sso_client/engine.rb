require 'devise'
module SsoClient
  class Engine < Rails::Engine

    def self.root_path
      @root_path ||= File.expand_path("../../../", __FILE__)
    end

    isolate_namespace SsoClient

    config.after_initialize do
      require 'configliere'
      Settings.define 'sso.host',   :env_var => 'SSO_HOST',   :required => true
      Settings.define 'sso.key',    :env_var => 'SSO_KEY',    :required => true
      Settings.define 'sso.secret', :env_var => 'SSO_SECRET', :required => true
      Settings.resolve!
    end

    initializer "sso_client.devise", :before => 'devise.omniauth' do |app|
      require "#{SsoClient::Engine.root_path}/lib/omniauth-identity/omniauth/strategies/identity"
      Devise.setup do |config|
        config.omniauth :identity,
                        Settings['sso.key'],
                        Settings['sso.secret'],
                        :client_options => {:site => Settings['sso.host']}
      end
    end

  end
end
