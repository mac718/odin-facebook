class AddCoverPhotoToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cover_photo, :string
  end
end
