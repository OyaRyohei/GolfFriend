class Public::RankingsController < ApplicationController
  def show
    @golf_spot = GolfSpot.find(params[:id])
    @ranked_posts = @golf_spot.posts.order("score ASC").limit(5)
    @post = current_user.posts.where(golf_spot_id: @golf_spot.id).order(score: :ASC).first
    scores = @golf_spot.posts.order("score ASC").pluck(:score)
    # pp scores
    # pp post
    if @post.present? && @post.score
      @rank = scores.index(@post.score)+1
    else @rank = "-"
    end
    # @ranks = Post.find(Post.group(:golf_spot_id).order('count(score) desc'))
    # @my_ranked = @golf_spot.posts.order('count_all desc').limit(1)
  end
end
