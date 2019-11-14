class AddEndTimeToRegulations < ActiveRecord::Migration[5.2]
  def change
    add_column :regulations, :end_time, :datetime
  end
end
