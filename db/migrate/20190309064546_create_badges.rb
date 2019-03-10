class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_url
      t.string :rule_type
      t.integer :rule_value

      t.timestamps
    end
  end
end
