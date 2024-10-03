class AddKeyPointsToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :key_points, :text
  end
end
