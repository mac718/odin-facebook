class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

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
  has_many :likes, foreign_key: 'liker_id'
  has_many :comments, :as => :commentable, :foreign_key => 'user_id'

  

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  def feed
    ids = (self.friends.pluck(:id) + self.inverse_friends.pluck(:id)) << self.id
    posts = Post.where(user_id: ids)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
