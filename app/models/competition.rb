class Competition < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {minimum: 0, maximum: 100}
  validates :left_time, presence: true
  validates :participants_number, presence: true, numericality: { only_integer: true }
  validates :details, presence: true
end
