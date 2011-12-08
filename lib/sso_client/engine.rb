module SsoClient
  class Engine < Rails::Engine
    isolate_namespace SsoClient

    engine_root = File.expand_path("../../../", __FILE__)

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    require 'omniauth'
    middleware.use OmniAuth::Builder do
      require "#{engine_root}/lib/omniauth-identity/omniauth/strategies/identity"
      configure do | config |
        config.path_prefix = ''
      end
      provider :identity, Settings['sso_provider.app_id'], Settings['sso_provider.app_secret']
    end
  end
end
