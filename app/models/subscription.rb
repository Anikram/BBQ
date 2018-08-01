class Subscription < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  before_create :user_is_owner?

  validates :event, presence: true
  validates :user_name, presence: true, unless: 'user.present?'
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: 'user.present?'
  validates :user, uniqueness: { scope: :event }, if: 'user.present?'

  validates :user_name, uniqueness: { scope: :event }
  validates :user_email, uniqueness: { scope: :event }

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
     throw :abort if self.event.user_id == self.user.id
  end
end
