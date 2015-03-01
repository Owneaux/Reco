class BusinessPromoter < ActiveRecord::Base
  belongs_to :business
  belongs_to :promoter
  validates :business_id, :uniqueness => { :scope => :promoter_id }
end
