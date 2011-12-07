Rails.application.routes.draw do
  mount SsoClient::Engine => "/auth"
  root :to => 'sso_client/home#show'
end
