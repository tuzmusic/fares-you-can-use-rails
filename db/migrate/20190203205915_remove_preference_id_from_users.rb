class RemovePreferenceIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :preference_id
  end
end
