class RemoveListingIdFromCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :listing_id
  end

  def down
    add_column :categories, :listing_id, :integer
  end
end
