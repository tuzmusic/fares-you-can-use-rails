class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.string :headline
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
