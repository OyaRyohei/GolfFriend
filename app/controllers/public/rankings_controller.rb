class Public::RankingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @golf_spot = GolfSpot.find(params[:id])
    @ranked_posts = @golf_spot.posts.order("golfscore ASC").limit(5)
    @post = current_user.posts.where(golf_spot_id: @golf_spot.id).order(golfscore: :ASC).first
    golfscores = @golf_spot.posts.order("golfscore ASC").pluck(:golfscore)
    if @post.present? && @post.golfscore
      @rank = golfscores.index(@post.golfscore)+1
    else @rank = "-"
    end
  end
end