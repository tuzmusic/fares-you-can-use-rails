class AddSlugToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :slug, :string
    add_index :deals, :slug, unique: true
  end
end
