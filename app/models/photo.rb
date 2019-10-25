class Photo < ApplicationRecord
  belongs_to :user, :foreign_key => 'image_id', optional: true #fix foreign key #validate user is signed-in user
  has_many :likes, :as => :likeable

  mount_uploader :image, ImageUploader

  Photo.find_each do |photo|
    photo.image.recreate_versions! if photo.image?
  end

  def photo_likers
    ids = self.likes.pluck(:liker_id)
    User.where(id: ids)
  end

  def photo_likers_names
    photo_liker_profiles = Profile.where(user_id: photo_likers)
    full_names = photo_liker_profiles.map { |profile| "#{profile.first_name} #{profile.last_name}"}
  end
end
