Rails.application.routes.draw do
  devise_for :users,
             :path => 'sso',
             :skip => [:registrations, :passwords, :confirmations],
             :controllers => {:omniauth_callbacks => "sso_client/omniauth_callbacks"} do
    get '/sso/sign_in' => redirect('/sso/auth/identity'), :as => :new_user_session
    get "/sso/sign_out", :to => "sso_client/sessions#destroy"
  end

  get '/sso/auth/identity', :as => :sign_on
  get "/sso/sign_out", :as => :sign_out
end
