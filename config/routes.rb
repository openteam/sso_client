SsoClient::Engine.routes.draw do
  root :to => 'home#show'

  # omniauth
  get '/:provider/callback', :to => 'user_sessions#create'
  get '/failure', :to => 'user_sessions#failure'

  # Custom logout
  get '/logout', :to => 'user_sessions#destroy'
end
