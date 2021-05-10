class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :image, presence: true
  belongs_to :user
end
