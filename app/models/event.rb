class Event < ActiveRecord::Base

  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 225}
  validates :address, presence: true
  validates :datetime, presence: true
end
