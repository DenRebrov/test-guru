class CreateJoinTableUserBadge < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :badges do |t|
       t.index [:user_id, :badge_id]
    end
  end
end
