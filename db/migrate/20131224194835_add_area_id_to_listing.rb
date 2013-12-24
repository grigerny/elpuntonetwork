class AddAreaIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :area_id, :integer
  end
end
