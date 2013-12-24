class Area < ActiveRecord::Base
  has_many :listings
  attr_accessible :name
end
