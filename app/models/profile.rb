class Profile < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :avatar, AvatarUploader
  #mount_uploader :photo, PhotoUploader
  mount_uploader :cover_photo, CoverPhotoUploader
end
