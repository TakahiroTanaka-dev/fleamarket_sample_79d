class Image < ApplicationRecord
  belongs_to :item

  # carrierwave
  mount_uploaders :images, ImageUploader
end
