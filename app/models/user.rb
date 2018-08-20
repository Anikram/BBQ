# :nodoc:
class User < ActiveRecord::Base
  # Include default devise modules. Others available are::omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :events, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :subscriptions, dependent: :nullify
  has_many :photos, dependent: :nullify

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, pn: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader


  def self.find_for_facebook_auth(token)
    byebug
  end

  private

  def set_name
    self.name = "Товарищ №#{rand(999)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
