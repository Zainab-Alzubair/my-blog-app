class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    render locals: {
      user: @user
    }
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
  end
end
