class AddStateToAirports < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :state, :string
  end
end
