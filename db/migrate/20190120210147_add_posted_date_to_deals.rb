class AddPostedDateToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :posted_date, :date
  end
end
