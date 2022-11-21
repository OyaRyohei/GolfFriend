class GolfSpot < ApplicationRecord
  has_many :posts
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @golf_spot = GolfSpot.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @golf_spot = GolfSpot.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @golf_spot = GolfSpot.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @golf_spot = GolfSpot.where("name LIKE?","%#{word}%")
    else
      @golf_spot = GolfSpot.all
    end
  end
end
