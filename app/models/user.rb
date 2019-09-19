class User < ApplicationRecord
  after_create :user_mailer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  #validates :password_confirmation, presence: true, on: :create
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
  has_many :photos
  
  def all_friends
    self.friends + self.inverse_friends
  end

  def remove_friend(friend)
    if self.friends.include?(friend)
      self.friends.destroy(friend)
    elsif self.inverse_friends.include?(friend)
      self.inverse_friends.destroy(friend)
    end
  end

  def feed
    ids = (self.friends.pluck(:id) + self.inverse_friends.pluck(:id)) << self.id
    posts = Post.where(user_id: ids).includes(:user, :likes, :comments)
  end

  def self.from_omniauth(auth)
    #facebook_user = nil?k
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      
      # assuming the user model has a name
      # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      #facebook_user = user?
    end
    unless user.profile
      full_name = auth.info.name.split
      profile = user.build_profile(first_name: full_name[0], last_name: full_name[1])
      user.profile.avatar = AvatarUploader.new
      user.profile.avatar.download! auth.info.image.gsub('http://','https://')
      profile.save!
    end
    user
  end

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private 
    def user_mailer
      UserMailer.welcome(self).deliver_now
    end
end
