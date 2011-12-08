SsoClient::Engine.routes.draw do
  root :to => 'home#show'

  # omniauth
  get "/:provider/callback", :to => 'user_sessions#create'
  get "/failure", :to => 'user_sessions#failure'

  # logout
  get "/logout", :to => 'user_sessions#destroy', :as => :logout
end

Rails.application.routes.draw do
  mount SsoClient::Engine => "/sso"
end
