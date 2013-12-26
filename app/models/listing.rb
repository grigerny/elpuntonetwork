class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :area
  attr_accessible :first_name, :last_name, :phone, :company, :website, :discount, :discount_english, :category_id, :img_url, :industry, :address1, :address2, :city, :state, :zip_code, :location, :area_id, :price, :reservations, :delivery, :kids, :menu, :alcohol, :hours

  validates_presence_of :area_id, :category_id, :company
  
  def full_street_address
    [address1, address2, city, state, zip_code].compact.join(', ')
  end
  
  geocoded_by :full_street_address
  after_validation :geocode

   
end
