class AddStateIdToAirports < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :state_id, :integer
  end
end
