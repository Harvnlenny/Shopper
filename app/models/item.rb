class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :cart
  mount_uploader :picture, PictureUploader
end
