class Feed < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :text, presence: true, length: {maximum: 255}
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end