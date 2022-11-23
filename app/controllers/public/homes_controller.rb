class Public::HomesController < ApplicationController

  def top
    @users = User.limit(3).order(created_at: :desc)
    @posts = Post.limit(5).order(created_at: :desc)
    @news = News.limit(3).order(created_at: :desc)
  end

  def about
  end
end
