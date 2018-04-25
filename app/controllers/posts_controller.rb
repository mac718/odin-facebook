class PostsController < ApplicationController
  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "New post addded!"
      redirect_to :back#user_path(current_user)
    else
      flash[:danger] = "Uh oh, something went wrong. Try again."
      render :new
    end
  end

  private 
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
