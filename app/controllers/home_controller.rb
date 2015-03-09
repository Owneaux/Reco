class HomeController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @header_title = "Today's referrals"
    @deal_type = DealType.all.first
    @deals_rcd = Deal.where(business_id: current_business.id).where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def check_out_referrals
    promoter_id = params[:promoter]
    referrals = params[:referrals]
    deal_rcd = Deal.where(promoter_id: promoter_id).where(business_id: current_business.id).where("created_at >= ?", Time.zone.now.beginning_of_day)
    if deal_rcd.size == 0
      @deal_type = DealType.all.first
      deal = Deal.create(
        promoter_id: promoter_id,
        business_id: current_business.id,
        deal_type_id: @deal_type.id,
        referrals: referrals)
      deal.save
    else
      deal = deal_rcd.first
      deal.referrals = deal.referrals + referrals.to_i
      deal.save
    end
    render nothing: true, status: 200
  end

  private
    def set_business_promoters
      @business_promoters = current_business.promoters
    end
end