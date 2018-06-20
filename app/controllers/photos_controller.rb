class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    byebug

    if @photo.save!
      flash[:success] = "Photo uploaded!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Oh no, your photo could not be saved!"
      redirect_to user_path(current_user)
    end
  end

  private 
    def photo_params
      params.require(:photo).permit(:user_id, :image)
    end
end
