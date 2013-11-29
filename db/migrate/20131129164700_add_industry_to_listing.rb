class AddIndustryToListing < ActiveRecord::Migration
  def change
    add_column :listings, :industry, :string
    add_column :listings, :address1, :string
    add_column :listings, :address2, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :zip_code, :string
  end
end
