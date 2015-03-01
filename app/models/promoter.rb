class Promoter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :business_promoters
  has_many :business, through: :business_promoters
  has_many :deals

  belongs_to :city
end
