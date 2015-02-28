class DealType < ActiveRecord::Base
  belongs_to :business
  has_many :deals
end
