class AddRegionIdToAirports < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :region_id, :integer
  end
end
