class SsoClient::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def identity
    user = User.from_omniauth(request.env['omniauth.auth'])
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Identity"
    sign_in_and_redirect user, :event => :authentication
  end
end
