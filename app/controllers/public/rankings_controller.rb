class Public::RankingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @golf_spot = GolfSpot.find(params[:id])
    @ranked_posts = @golf_spot.posts.order("score ASC").limit(5)
    @post = current_user.posts.where(golf_spot_id: @golf_spot.id).order(score: :ASC).first
    scores = @golf_spot.posts.order("score ASC").pluck(:score)
    if @post.present? && @post.score
      @rank = scores.index(@post.score)+1
    else @rank = "-"
    end
  end
end

end
