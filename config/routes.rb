Rails.application.routes.draw do
  devise_for :users,
             :path => 'sso',
             :skip => [:registrations, :passwords, :confirmations],
             :controllers => {:omniauth_callbacks => "sso_client/omniauth_callbacks"} do
    get 'sign_in' => redirect('/sso/auth/identity'), :as => :new_user_session
    get "sign_out", :to => "devise/sessions#destroy"
  end

  get '/sso/auth/identity', :as => :single_sign_on
end
