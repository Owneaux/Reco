class Business < ActiveRecord::Base
  has_many :deal_types
  has_many :deals through: deal_types
end
