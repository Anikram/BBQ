class Event < ActiveRecord::Base

  validates :title, presence: true, length: {maximum: 225}
  validates :address, presence: true
  validates :datetime, presence: true
end
