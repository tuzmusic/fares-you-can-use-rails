class RenameDestinations < ActiveRecord::Migration[5.2]
  def change
    rename_table :destinations, :destination_airports
  end
end
