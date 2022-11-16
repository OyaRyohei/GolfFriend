class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :set_user, only: [:likes]

  def show
    @user = User.find(params[:id])
    @username = @user.name
    @posts = @user.posts
  end
  
  def index
    @users = User.all
  end

  def likes
    @likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(@likes)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
