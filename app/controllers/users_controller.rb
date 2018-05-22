class UsersController < ApplicationController
  before_action :authenticate_user!

  def home 
  end

  def index
    @users = User.all 
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
