class HomeController < ApplicationController
  before_action :set_business_promoters, only: [:index]
  before_action :set_deal_type, only: [:index, :check_out_referrals]

  def index
    @header_title = "Promoters"
    @promoters_data = get_promoters_data(@business_promoters)
  end

  def check_out_referrals
    promoter_id = params[:promoter]
    referrals = params[:referrals]
    deal = Deal.create(
      promoter_id: promoter_id,
      business_id: current_business.id,
      deal_type_id: @deal_type.id,
      referrals: referrals
      )
    if deal.save
      render nothing: true, status: 200
    end
  end

  private

    def get_promoters_data(promoters)
      promoters_data = []
      promoters.each do |promoter|
        promoter_data = {}
        referrals = Deal.where(business_id: current_business.id, promoter_id: promoter.id).sum(:referrals)
        payments = Payment.where(business_id: current_business.id, promoter_id: promoter.id).sum(:amount)
        promoter_data[:promoter] = promoter
        promoter_data[:credit] = referrals - payments
        promoters_data << promoter_data
      end
      promoters_data
    end

    def set_deal_type
      @deal_type = current_business.deal_type
      if @deal_type.nil?
        @deal_type = DealType.create(
        name: 'default deal type',
        commission: 0.0,
        description: '',
        business_id: current_business.id
        )
        @deal_type.save
      end
    end

    def set_business_promoters
      @business_promoters = current_business.promoters
    end
end