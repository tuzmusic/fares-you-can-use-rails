class DropPreferenceVacations < ActiveRecord::Migration[5.2]
  def change
    drop_table :preference_vacations
  end
end
