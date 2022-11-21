class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @golf_spots = GolfSpot.looks(params[:search], params[:word])
    end
  end

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @golf_spots = GolfSpot.looks(params[:search], params[:word])
    end
  end
end
