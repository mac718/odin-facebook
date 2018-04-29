class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :posts
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, :through => :friend_requests, :source => :friend
  has_many :inverse_friend_requests, class_name: 'FriendRequest', foreign_key: 'friend_id'
  has_many :inverse_pending_friends, :through => :inverse_friend_requests, :source => 'user'

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  def friends_posts
    friends_posts = []
    self.friends.each do |friend|
      friend.posts.each do |post|
        friends_posts << post
      end
    end

    self.inverse_friends.each do |inverse_friend|
      inverse_friend.posts.each do |post|
        friends_posts << post
      end
    end
    friends_posts
  end
end
