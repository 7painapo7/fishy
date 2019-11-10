class CreateRegulations < ActiveRecord::Migration[5.2]
  def change
    create_table :regulations do |t|
      t.integer :group_id
      t.string :genre
      t.text :punishment

      t.timestamps
    end
  end
end
