class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def home 
  end

  def index 
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
