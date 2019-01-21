class AddBlogHeadAndBlogFootToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :blog_head, :string
    add_column :deals, :blog_foot, :string
  end
end
