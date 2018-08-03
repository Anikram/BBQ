class Subscription < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  before_create :user_is_owner? if -> {user.present?}

  validates :event, presence: true
  validates :user_name, presence: true, unless: 'user.present?'
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: 'user.present?'
  validates :user, uniqueness: { scope: :event }, if: 'user.present?'

  validates :user_name, uniqueness: { scope: :event }
  validates :user_email, uniqueness: { scope: :event }

  validate :email_uniqueness_for_anonymus, unless: -> {user.present?}

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def user_is_owner?
     errors.add(:user_email, :invalid) if self.event.user.email == user_email
  end

  def email_uniqueness_for_anonymus
    errors.add(:user_email, :invalid) if User.exists?(email: self.user_email)
  end
end
