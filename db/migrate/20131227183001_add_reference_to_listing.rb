class AddReferenceToListing < ActiveRecord::Migration
  def change
       add_column :listings, :reference, :text
  end
end
