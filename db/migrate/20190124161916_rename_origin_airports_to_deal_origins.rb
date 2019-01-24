class RenameOriginAirportsToDealOrigins < ActiveRecord::Migration[5.2]
  def change
    rename_table :origin_airports, :deal_origins
  end
end
