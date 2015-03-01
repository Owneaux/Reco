class BusinessPromoter < ActiveRecord::Base
  belongs_to :business
  belongs_to :promoter
end
