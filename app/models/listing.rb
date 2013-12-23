class Listing < ActiveRecord::Base
  belongs_to :category
  attr_accessible :first_name, :last_name, :phone, :company, :website, :discount, :discount_english, :category_id, :img_url, :industry, :address1, :address2, :city, :state, :zip_code, :location
  default_scope order('industry ASC')
  
  def full_street_address
    [address1, address2, city, state, zip_code].compact.join(', ')
  end
  
  geocoded_by :full_street_address
  after_validation :geocode
  

end
