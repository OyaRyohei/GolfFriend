class Public::RankingsController < ApplicationController
  def show
    @golf_spot = GolfSpot.find(params[:id])
    @ranked_posts = @golf_spot.posts.order("score ASC").limit(5)
    # @ranks = Post.find(Post.group(:golf_spot_id).order('count(score) desc'))
  end
end
