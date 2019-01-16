class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :airport_id
      t.integer :deal_id

      t.timestamps
    end
  end
end
