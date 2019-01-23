class RenameStateToStateNameInAirports < ActiveRecord::Migration[5.2]
  def change
    rename_column :airports, :state, :state_name
  end
end
