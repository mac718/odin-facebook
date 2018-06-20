class Profile < ApplicationRecord
  belongs_to :user, optional: true

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_photo, CoverPhotoUploader

  Profile.find_each do |profile|
    profile.cover_photo.recreate_versions! if profile.cover_photo?
  end
end
