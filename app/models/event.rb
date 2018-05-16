class Event < ActiveRecord::Base

  belongs_to :user

  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 225}
  validates :address, presence: true
  validates :datetime, presence: true
end
