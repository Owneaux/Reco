class Promoter < ActiveRecord::Base
  has_many :deals
  has_many :businesses
end
