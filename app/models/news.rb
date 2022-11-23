class News < ApplicationRecord
  belongs_to :admin

  enum list: { 重要: 0, 障害: 1, メンテナンス:2, アップデート:3}
end
