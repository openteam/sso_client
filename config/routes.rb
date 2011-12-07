SsoClient::Engine.routes.draw do
  root :to => 'home#show'

  # omniauth
  get '/auth/:provider/callback', :to => 'user_sessions#create'
  get '/auth/failure', :to => 'user_sessions#failure'

  # Custom logout
  get '/auth/logout', :to => 'user_sessions#destroy'
end
