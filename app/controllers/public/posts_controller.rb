class Public::PostsController < ApplicationController
  # ログインしていないと、閲覧できない
  before_action :authenticate_user!

  # ログインユーザー以外は編集・削除できない
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  # 投稿機能
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render "index"
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = @post.user
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body, :golf_spot, :score)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
