class CreateOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :origins do |t|
      t.integer :airport_id
      t.integer :deal_id

      t.timestamps
    end
  end
end
`