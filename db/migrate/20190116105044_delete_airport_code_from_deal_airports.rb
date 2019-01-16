class DeleteAirportCodeFromDealAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :deal_airports, :airport_code
  end
end
