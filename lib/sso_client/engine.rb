require 'devise'
require File.expand_path("../../../lib/omniauth/strategies/identity", __FILE__)

module SsoClient
  class Engine < Rails::Engine
    isolate_namespace SsoClient

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    initializer "sso_client.devise", :before => 'devise.omniauth' do |app|
      Devise.setup do |config|
        config.omniauth :identity, Settings['sso_provider.app_id'], Settings['sso_provider.app_secret'], :client_options => {:site => Settings['sso_provider.host']}
      end
    end
  end
end
