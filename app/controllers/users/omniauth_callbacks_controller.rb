class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_auth request.env['omniauth.auth']

    if @user.persisted?
      flash[:notice] = i18n('device.omniauth_callbacks.succsess', kind: 'Facebook')
      sign_in_and_redirect @user, event: authentication
    else
      flash[:error] = i18n('device.omniauth_callbacks.failure',
                           kind: 'Facbook',
                           reason: 'authentication error')
      redirect_to root_path
    end
  end
end