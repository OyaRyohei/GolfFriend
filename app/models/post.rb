class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  
  validates :body, presence:true, length:{maximum:200}
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
