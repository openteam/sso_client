require 'devise'
module SsoClient
  class Engine < Rails::Engine

    def self.root_path
      @root_path ||= File.expand_path("../../../", __FILE__)
    end

    isolate_namespace SsoClient

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    initializer "sso_client.devise", :before => 'devise.omniauth' do |app|
      require "#{SsoClient::Engine.root_path}/lib/omniauth-identity/omniauth/strategies/identity"
      Devise.setup do |config|
        config.omniauth :identity,
                        Settings['sso_provider.app_id'],
                        Settings['sso_provider.app_secret'],
                        :client_options => {:site => Settings['sso_provider.host']}
      end
    end

  end
end
