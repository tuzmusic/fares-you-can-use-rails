class RenameOrigins < ActiveRecord::Migration[5.2]
  def change
    rename_table :origins, :origin_airports
  end
end
