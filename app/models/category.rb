class Category < ActiveRecord::Base
 belongs_to :directory
 has_many :listings
end
