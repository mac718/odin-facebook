class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, :as => :likeable

  def post_likers
    ids = self.likes.pluck(:liker_id)
    User.where(id: ids)
  end

  def post_likers_names
    post_liker_profiles = Profile.where(user_id: post_likers)
    first_name = post_liker_profiles.pluck(:first_name)
    last_names = post_liker_profiles.pluck(:last_name)
    full_names = first_name.zip(last_names).map { |full_name| "#{full_name[0]} #{full_name[1]}"}
  end
end
