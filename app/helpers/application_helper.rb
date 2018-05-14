module ApplicationHelper
  def user_avatar(user)
    #todo userreal avatars
    asset_path('burger.png')
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
end
