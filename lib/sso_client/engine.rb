module SsoClient
  class Engine < Rails::Engine
    isolate_namespace SsoClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.autoload_paths << "#{engine_root}/lib/omniauth-identity"

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    require 'omniauth'
    middleware.use OmniAuth::Builder do
      require "#{engine_root}/lib/omniauth-identity/omniauth/strategies/identity"
      provider :identity, Settings['sso_provider.app_id'], Settings['sso_provider.app_secret']
    end
  end
end
