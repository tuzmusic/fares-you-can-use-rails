class RenameDestinationAirportsToDealDestinations < ActiveRecord::Migration[5.2]
  def change
    rename_table :destination_airports, :deal_destinations
  end
end
