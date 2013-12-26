class AddMoreToListing < ActiveRecord::Migration
  def change
    add_column :listings, :price, :string
    add_column :listings, :reservations, :string
    add_column :listings, :delivery, :string
    add_column :listings, :kids, :string
    add_column :listings, :menu, :string
    add_column :listings, :alcohol, :string
    add_column :listings, :hours, :text
  end
end
