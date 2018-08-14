# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :user_can_subscribe?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def user_can_subscribe?
    true unless @event.user_id == current_user.id && @event.subscriptions.map(&:id).include?(current_user.id)
  end
end
