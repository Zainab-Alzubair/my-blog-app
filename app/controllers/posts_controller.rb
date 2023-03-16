class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @user = User.find(@user.user_id, :include => :posts)
  end

  def show
    @post = Post.find_by_id(params[:id])
  end
end
