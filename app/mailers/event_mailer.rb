class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.subscription.subject
  #
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: @event.user.email, subject: "#{t('event_mailer.subscription.title')} на #{event.title}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.comment.subject
  #
  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "#{t('event_mailer.comment.title')} @ #{event.title}"
  end

  def photo(event, photo, email)
    @event = event
    @photo = photo
    @email = email

    attachments['image.jpg'] = File.read("public/#{photo.photo.url}")

    mail to: email, subject: "#{t('event_mailer.photo.title')} @ #{event.title}"
  end
end
