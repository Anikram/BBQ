# :nodoc:
module ApplicationHelper
  def user_avatar(user)
    if user.avatar.file.present? && user.present?
     user.avatar.url
    else
     asset_path('burger.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
     user.avatar.thumb.url
    else
     asset_path('burger.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('bbq-pic.png')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('bbq-pic_thumb.png')
    end
  end

  def decline_it(number, krokodil, krokodila, krokodilov)
    number = 0 if number == nil || !number.is_a?(Numeric)
    remainder = number % 100
    return krokodilov if remainder >= 11 && remainder <= 20
    remainder = number % 10
    if remainder == 1
      krokodil
    elsif remainder >= 2 && remainder <= 4
      krokodila
    else
      krokodilov
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def subscribed?
    return if current_user.nil?
    true if @event.subscriptions.map(&:user_id).select { |x|!x.nil? }.include?(current_user.id)
  end

  def owner?
    return if current_user.nil?
    @event.user_id == current_user.id
  end
end
