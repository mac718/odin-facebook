class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.build(comment_params)
    if @comment.save!
      redirect_to :back
    else
      flash[:danger] = "Comment could not be posted."
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :content, :commentable_type)
    end
end
