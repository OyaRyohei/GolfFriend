class Tag < ApplicationRecord
  has_many :user_tags, dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数のユーザーを持つ　それは、post_tagsを通じて参照できる
  has_many :users, through: :user_tags

  validates :name, uniqueness: true, presence: true
end
