require 'omniauth'
require File.expand_path("../../../lib/omniauth/strategies/identity", __FILE__)

module SsoClient
  class Engine < Rails::Engine
    isolate_namespace SsoClient

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    middleware.use OmniAuth::Builder do
      configure do | config |
        config.path_prefix = ''
      end
      provider :identity, Settings['sso_provider.app_id'], Settings['sso_provider.app_secret'], :client_options => {:site => Settings['sso_provider.host']}
    end
  end
end
