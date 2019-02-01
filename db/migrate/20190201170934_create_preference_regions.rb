class CreatePreferenceRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :preference_regions do |t|
      t.references :preference, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
