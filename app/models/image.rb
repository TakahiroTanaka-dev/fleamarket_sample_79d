class Image < ApplicationRecord
  belongs_to :item
  # carrierwave
  mount_uploader :image, ImageUploader
end
