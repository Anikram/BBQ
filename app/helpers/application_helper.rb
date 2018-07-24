module ApplicationHelper
  def user_avatar(user)
     if user.avatar.file.present?
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

  # Anikram 2018 - Method declines word in russian
  def decline_it (number, krokodil, krokodila, krokodilov)
    if (number == nil || !number.is_a?(Numeric))
      number = 0
    end

    remainder = number % 100

    if (remainder >= 11 && remainder <= 20)
      return krokodilov
    end

    remainder = number % 10

    if (remainder == 1)
      return  krokodil
    elsif (remainder >= 2 && remainder <= 4)
      return  krokodila
    else
      return krokodilov
    end
  end

  def is_current_user?(user)
    user == current_user
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def subscribed?
    return if current_user.nil?
    true if @event.subscriptions.map(&:user_id).select{|x|!x.nil?}.include?(current_user.id)
  end

  def owner?
    return if current_user.nil?
    @event.user_id == current_user.id
  end


end
