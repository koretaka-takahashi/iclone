class Feed < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: {maximum: 255}
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
