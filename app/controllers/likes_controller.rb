class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(likeable_id: params["post_id"], likeable_type: params[:likeable])

    if @like.save!
      redirect_to :back
    else 
      flash[:danger] = "Oh no!"
      redirect_to :back
    end
  end

  def destroy
  end
end
