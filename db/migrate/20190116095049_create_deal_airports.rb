class CreateDealAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :deal_airports do |t|
      t.integer :deal_id
      t.integer :airport_id
      t.string :airport_code

      t.timestamps
    end
  end
end
