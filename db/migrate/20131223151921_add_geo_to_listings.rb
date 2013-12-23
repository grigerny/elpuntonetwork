class AddGeoToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
    add_column :listings, :location, :string
  end
end
