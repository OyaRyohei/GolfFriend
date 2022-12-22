class Public::HomesController < ApplicationController

  def top
    @users = User.limit(3).order(created_at: :desc)
    @posts = Post.includes(:user).where(user: { is_deleted: false } ).limit(5).order(created_at: :desc)
    @news = News.limit(3).order(created_at: :desc)
    if user_signed_in?
      @user = current_user
    end
  end

  def about
  end

end
