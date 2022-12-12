class Public::PostsController < ApplicationController
  # ログインしていないと、閲覧できない
  before_action :authenticate_user!

  # ログインユーザー以外は削除できない
  before_action :ensure_correct_user, only: [:destroy]

  # 投稿機能
  def new
    @post = Post.new
    @golf_spots = GolfSpot.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # AI機能
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render "index"
    end
  end

  def index
    # includes アソシエーションを繋いだテーブル同士を結合させる
    @posts = Post.includes(:user).where(user: { is_deleted: false } )
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
    params.require(:post).permit(:body, :golfscore, :golf_spot_id, :image)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
