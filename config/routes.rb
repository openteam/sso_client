Rails.application.routes.draw do
  devise_for :users,
             :path => 'sso',
             :skip => :registrations,
             :controllers => { :omniauth_callbacks => "sso_client/omniauth_callbacks" }
end
