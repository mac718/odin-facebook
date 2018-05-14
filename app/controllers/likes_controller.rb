class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(likeable_id: params["#{params[:likeable].downcase}_id"], likeable_type: params[:likeable])

    if @like.save!
      redirect_to :back
    else 
      flash[:danger] = "Oh no!"
      redirect_to :back
    end
  end

  def destroy
    @like = current_user.likes.where('likeable_id = ? AND likeable_type = ?', params["#{params[:likeable].downcase}_id"], params[:likeable])[0]
    Like.destroy(@like.id)
    redirect_back fallback_location: current_user
  end
end
