class BusinessController < ApplicationController
  def show
    @business = current_business
    business_deals = Deal.where(business_id: current_business.id)
    @deals = business_deals.size
    @referrals = Deal.where(business_id: current_business.id).sum(:referrals)
    @promoters = current_business.promoters.size

    @subheader = true
    @subheader_right_action = {
      path:  edit_business_registration_path,
      text: "",
      icon: "ui-btn-right ui-icon-edit ui-btn-icon-notext ui-corner-all"
    }
  end
end
