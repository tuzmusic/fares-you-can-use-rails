class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :text
      t.integer :deal_id

      t.timestamps
    end
  end
end
