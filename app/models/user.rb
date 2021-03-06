class User < ApplicationRecord
  has_many :feeds
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
  validates :profile_image, presence: true
  mount_uploader :profile_image, ProfileImageUploader
end
