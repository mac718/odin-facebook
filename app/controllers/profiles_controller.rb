class ProfilesController < ApplicationController
  def new 
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save!
      flash[:success] = "Hooray! Your profile has been saved!"
      redirect_to root_path
    else
      flash[:dange] = "Uh oh, something went wrong."
      render :new
    end
  end

  def update_avatar
    @profile = Profile.find_by(user_id: params[:profile][:id])

    if @profile.update_attribute(:avatar, params[:profile][:avatar])
      redirect_to user_path(params[:profile][:id])
    end

  end

  private 
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :birthday, :gender, :avatar)
    end
end
