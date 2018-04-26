class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :posts
  has_many :friendships, :foreign_key => :acceptor_id
  has_many :requesters, :through => :friendships
  has_many :friendships, :foreign_key => :requester_id
  has_many :acceptors, :through => :friendships
  has_many :friend_requests
end
