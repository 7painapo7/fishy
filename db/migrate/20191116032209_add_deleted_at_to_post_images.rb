class AddDeletedAtToPostImages < ActiveRecord::Migration[5.2]
  def change
  	add_column :post_images, :deleted_at, :datetime
    add_index :post_images, :deleted_at
  end
end
