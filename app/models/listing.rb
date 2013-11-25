class Listing < ActiveRecord::Base
  belongs_to :category
  attr_accessible :first_name, :last_name, :phone, :company, :website, :discount, :category_id, :img_url
end
