class AddDiscountEnglishToListing < ActiveRecord::Migration
  def change
    add_column :listings, :discount_english, :text
  end
end
