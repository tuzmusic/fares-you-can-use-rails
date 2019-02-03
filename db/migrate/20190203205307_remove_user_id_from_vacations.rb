class RemoveUserIdFromVacations < ActiveRecord::Migration[5.2]
  def change
    remove_column :vacations, :user_id
  end
end
