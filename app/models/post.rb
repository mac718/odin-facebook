class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, :as => :likeable

  def post_likers
    ids = self.likes.pluck(:liker_id)
    User.where(id: ids)
  end

  def post_likers_names
    post_liker_profiles = Profile.where(user_id: post_likers)
    full_names = post_liker_profiles.map { |profile| "#{profile.first_name} #{profile.last_name}"}
  end
end
