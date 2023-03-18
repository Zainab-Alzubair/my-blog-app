class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    render locals: {
      user: @user
    }
    @posts = @user.posts.order(created_at: :desc).limit(3)
  end
end
