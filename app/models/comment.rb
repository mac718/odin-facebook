class Comment < ApplicationRecord
  attr_readonly :likes_count

  belongs_to :commentable, :polymorphic => true
  has_many :likes, :as => :likeable

  def comment_likers
    ids = self.likes.pluck(:liker_id)
    User.where(id: ids)
  end

  def comment_likers_names
    comment_liker_profiles = Profile.where(user_id: comment_likers)
    full_names = comment_liker_profiles.map { |profile| "#{profile.first_name} #{profile.last_name}"}
  end
end
