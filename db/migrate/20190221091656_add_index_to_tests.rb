class AddIndexToTests < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, :title, unique: true
    add_index :tests, :level, unique: true
  end
end
