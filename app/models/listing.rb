class Listing < ActiveRecord::Base
  belongs_to :category
  attr_accessible :first_name, :last_name, :phone, :company, :website, :discount, :category_id, :img_url, :industry, :address1, :address2, :city, :state, :zip_code
end
