class CreatePreferenceVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :preference_vacations do |t|
      t.references :preference, foreign_key: true
      t.references :vacation, foreign_key: true

      t.timestamps
    end
  end
end
