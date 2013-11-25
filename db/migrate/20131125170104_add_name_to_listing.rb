class AddNameToListing < ActiveRecord::Migration
  def change
    add_column :listings, :first_name, :string
    add_column :listings, :last_name, :string
    add_column :listings, :phone, :string
    add_column :listings, :company, :string
    add_column :listings, :website, :string
    add_column :listings, :discount, :text
  end
end
