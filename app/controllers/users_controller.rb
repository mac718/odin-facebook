class UsersController < ApplicationController
  before_action :authenticate_user!

  def home 
  end

  def index
    @users = User.all 
  end

  def show
    @post = Post.new
    @user = User.includes(:profile).find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :gender, :occupation)
    end
end
