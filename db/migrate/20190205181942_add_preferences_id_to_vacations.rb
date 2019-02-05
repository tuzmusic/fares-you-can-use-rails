class AddPreferencesIdToVacations < ActiveRecord::Migration[5.2]
  def change
    add_column :vacations, :preference_id, :integer
  end
end
