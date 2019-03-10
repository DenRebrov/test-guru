class AddAttemptToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :attempt, :integer, default: 0
  end
end
