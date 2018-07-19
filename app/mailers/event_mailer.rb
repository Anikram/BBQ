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
  def comment(event, comment, email, photo = "none")
    @comment = comment
    @event = event
    @photo = photo

    mail to: email, subject: "#{t('event_mailer.comment.title')} @ #{event.title}"
  end
end
