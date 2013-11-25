class Category < ActiveRecord::Base
 has_many :listings
 
 attr_accessible :name, :listing_id
end
