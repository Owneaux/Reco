class City < ActiveRecord::Base
  has_many :businesses
  has_many :promoters
end
