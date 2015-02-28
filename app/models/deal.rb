class Deal < ActiveRecord::Base
  belongs_to :deal_type
  belongs_to :promoter
  belongs_to :business
end
