class DeleteDealAirports < ActiveRecord::Migration[5.2]
  def change
    drop_table :deal_airports
  end
end
