class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.text :fish_image
      t.string :fish_name
      t.integer :size
      t.integer :count
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
