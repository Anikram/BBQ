# :nodoc:
class Event < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :nullify
  has_many :subscriptions, dependent: :nullify
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :nullify

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 225}
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(pin2check)
    self.pincode == pin2check
  end
end
