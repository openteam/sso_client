Rails.application.routes.draw do
  mount SsoClient::Engine => "/sso_client"
  root :to => 'sso_client/home#show'
end
