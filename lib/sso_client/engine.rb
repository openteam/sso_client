module SsoClient
  class Engine < Rails::Engine
    isolate_namespace SsoClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.autoload_paths << "#{engine_root}/lib/omniauth-identity"

    config.after_initialize do
      raise 'Please specify sso_provider.host in settings.yml' unless defined?(Settings) && Settings[:sso_provider]
    end

    require 'omniauth'

    require "#{engine_root}/lib/omniauth-identity/omniauth/strategies/identity"
    initializer "my_engine.add_middleware" do |app|
      app.middleware.use ::OmniAuth::Builder do
        provider :identity, 'YE0NYveQGoFsNLX220Dy5g', 'aqpGBedDnHFyp5MmgT8KErr9D015ScmaY8r3vHg5C0'
      end
    end
  end
end
