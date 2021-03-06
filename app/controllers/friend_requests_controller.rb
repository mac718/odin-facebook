class FriendRequestsController < ApplicationController
  before_action :set_friend_request, :except => [:index, :create]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    puts 'hello'
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)

    if @friend_request.save
      #render :show, status: :created, location: @friend_request
      redirect_back fallback_location: 'users/home'
    else
      render json: @friend_request.errors, status: :unprocessable_entity
    end
  end

  def update 
    @friend_request.accept
    redirect_back fallback_location: 'users/home'
  end

  def destroy
    @friend_request.destroy
  end

  private 
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end
end
