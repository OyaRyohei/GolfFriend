class CreateGolfSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :golf_spots do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
