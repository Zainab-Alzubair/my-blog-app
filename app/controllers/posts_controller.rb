class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0
    if @post.save
      redirect_to user_posts_path(params[:user_id])
    else
      render :new
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @posts =  @user.posts
    render locals: {
      user: @user
    }
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id)
  end
end
