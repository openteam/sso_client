require 'configliere'

Settings.read(Rails.root.join('config', 'settings.yml'))

Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
Settings.extract!(:test, :development, :production)

Settings.define 'host',                       :env_var => 'HOST',                   :require => true
Settings.define 'sso_server.host',            :env_var => 'sso_server.host',        :require => true
Settings.resolve!
