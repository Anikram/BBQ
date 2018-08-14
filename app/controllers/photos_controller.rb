# :nodoc:
class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  # POST /photos
  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers(@event, @new_photo)
      redirect_to @event, notice: t('controllers.photo.created')
    else
      render 'events/show', alert: t('controllers.photo.errors.general')
    end
  end

  # DELETE /photos/1
  def destroy
    message = { notice: t('controllers.photo.destroyed') }

    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = { alert: t('controllers.photo.error') }
    end

    redirect_to @event, message
  end

  private

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo, :user_id, :event_id)
  end

  def email_is_valid?
    true unless User.all.map(&:email).select { |x| x =~ @new_subscription.user_email }
  end

  def notify_subscribers(event, photo)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [photo.user.email]).uniq
    # do not notify author
    all_emails.each do |mail|
      EventMailer.photo(event, photo, mail).deliver_now
    end
  end
end
