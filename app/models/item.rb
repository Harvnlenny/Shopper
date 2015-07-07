class Item < ActiveRecord::Base
  belongs_to :List
  mount_uploader :picture, PictureUploader
end
