Rails.application.routes.draw do

  mount SsoClient::Engine => "/sso_client"
end
