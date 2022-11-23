class Admin::NewsController < ApplicationController
  # 管理者ログインしていないと、閲覧できない
  before_action :authenticate_admin!

  # 管理者以外は削除できない
  before_action :ensure_correct_admin, only: [:destroy]

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.admin_id = current_admin.id
    if @news.save
      redirect_to admin_news_path(@news.id)
    else
      @news = News.all
      render "index"
    end
  end

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  private
  def news_params
    params.require(:news).permit(:list, :title, :body)
  end
end
