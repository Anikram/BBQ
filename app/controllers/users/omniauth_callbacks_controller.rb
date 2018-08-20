class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_auth request.env['omniauth.auth']

    if @user.persisted?
      flash[:notice] = t('devise.omniauth_callbacks.success', kind: 'Facebook')
      sign_in_and_redirect @user, event: authenticate_user!
    else
      flash[:error] = t('devise.omniauth_callbacks.failure',
                           kind: 'Facbook',
                           reason: 'authentication error')
      redirect_to root_path
    end
  end
end