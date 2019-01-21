class AddForeignKeyForOriginAirportsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :origin_airports, :deals, column: :deal_id, on_delete: :cascade
    add_foreign_key :destination_airports, :deals, column: :deal_id, on_delete: :cascade
  end
end
