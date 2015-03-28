class HomeController < ApplicationController
  before_action :set_business_promoters, only: [:index]
  before_action :set_deal_type, only: [:index, :check_out_referrals]

  def index
    @header_title = "Promoters"
    @deals_rcd = Deal.where(business_id: current_business.id).where("created_at >= ? AND paid = ?", Time.zone.now.beginning_of_day, false)

    @header_left_action = {
      path: business_promoters_new_path,
      text: "",
      icon: "ui-btn-left ui-btn-icon-notext ui-corner-all",
      data: { icon: "fa-plus", mini: "true"}
    }
  end

  def check_out_referrals
    promoter_id = params[:promoter]
    referrals = params[:referrals]
    deal_rcd = Deal.where(promoter_id: promoter_id).where(business_id: current_business.id).where("created_at >= ? AND paid = ?", Time.zone.now.beginning_of_day, false)
    if deal_rcd.size == 0
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