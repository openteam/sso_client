require 'configliere'

Settings.read(Rails.root.join('config', 'settings.yml'))

Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
Settings.extract!(:test, :development, :production)

Settings.define 'host',                       :env_var => 'HOST',                   :require => true
Settings.define 'sso_provider.host',          :env_var => 'SSO_PROVIDER_HOST',      :require => true
Settings.resolve!
