class Photo < ApplicationRecord
  belongs_to :profile, :foreign_key => 'image_id'
  has_many :likes, :as => :likeable

  mount_uploader :image, ImageUploader
end
