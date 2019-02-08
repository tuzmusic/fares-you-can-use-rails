class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :comment
      t.integer :deal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
