class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]


  # POST /subscriptions
  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @event.user.email == current_user.email
      redirect_to @event, alert: t('controllers.subscription.errors.self_subscription')
      @new_subscription.delete
    else
      begin
        @new_subscription.save!
        #EventMailer.subscription(@event, @new_subscription).deliver_now
        redirect_to @event, notice: t('controllers.subscription.created')
      rescue ActiveRecord::RecordNotUnique
        redirect_to @event, alert: t('controllers.subscription.errors.registered_email')
      end
    end
  end

  # DELETE /subscriptions/1
  def destroy
    message = {notice: t('controllers.subscription.destroyed')}

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: t('controllers.subscription.error')}
    end

    redirect_to @event, message
  end

  private

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Only allow a trusted parameter "white list" through.
  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end

  def email_exist?(email)
    User.where(user_email: "#{email}")
  end
end
