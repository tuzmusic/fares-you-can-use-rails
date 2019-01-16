class AddInstructionsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :instructions, :string
  end
end
