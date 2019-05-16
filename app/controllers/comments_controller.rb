class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
