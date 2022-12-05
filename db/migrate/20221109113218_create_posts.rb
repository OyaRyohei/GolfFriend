class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id     , null: false
      t.integer :golf_spot_id
      t.string  :body        , null: false
      t.integer :golfscore

      t.timestamps
    end
  end
end
