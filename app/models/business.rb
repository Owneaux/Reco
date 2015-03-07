class Business < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :deal_type
  has_many :deals, through: :deal_types
  has_many :business_promoters
  has_many :promoters, through: :business_promoters

  belongs_to :city
end
