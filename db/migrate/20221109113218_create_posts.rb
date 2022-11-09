class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id     , null: false
      t.string  :body        , null: false
      t.string  :golf_spot
      t.integer :score

      t.timestamps
    end
  end
end
