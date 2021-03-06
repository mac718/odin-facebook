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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to user_path(params[:profile][:user_id])
    puts params
  end

  def update_avatar
    @profile = Profile.find_by(user_id: params[:profile][:id])

    if @profile.update_attribute(:avatar, params[:profile][:avatar])
      redirect_to user_path(params[:profile][:id])
    end

  end

  def update_cover_photo
    @profile = Profile.find_by(user_id: params[:profile][:id])

    if @profile.update_attribute(:cover_photo, params[:profile][:cover_photo])
      redirect_to user_path(params[:profile][:id])
    end

  end

  private 
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :birthday, :gender, :avatar, :pic)
    end
end
