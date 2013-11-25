class AddListingIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :listing_id, :integer
    add_column :categories, :name, :string
  end
end
