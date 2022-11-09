class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      
      t.integer :admin_id , null: false
      t.integer :list     , null: false, default: 0
      t.string  :title    , null: false
      t.string  :body     , null: false

      t.timestamps
    end
  end
end
