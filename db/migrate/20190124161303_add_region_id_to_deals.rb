class AddRegionIdToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :region_id, :integer
  end
end
