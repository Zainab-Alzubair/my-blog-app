class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: params[:post_id])
  end
end
