class UsersController < ApplicationController
  before_action :authenticate_user!

  def home 
  end
  
  def index 
  end

  def show
    @post = Post.new
    @user = current_user
    @posts = @user.posts
  end
end
