class CreatePreferenceHomeAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :preference_home_airports do |t|
      t.references :preference, foreign_key: true
      t.references :airport, foreign_key: true

      t.timestamps
    end
  end
end
