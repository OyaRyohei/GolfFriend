class Public::PostsController < ApplicationController
  # ログインしていないと、閲覧できない
  before_action :authenticate_user!

  # ログインユーザー以外は編集・削除できない
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  # 投稿機能
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

  private
  def post_params
    params.require(:post).permit(:body, :golf_spot, :score)
  end
end
