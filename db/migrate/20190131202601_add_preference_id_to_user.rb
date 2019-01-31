class AddPreferenceIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :preference_id, :integer unless column_exists? :users, :preference_id
  end
end
