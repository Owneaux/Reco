class BusinessController < ApplicationController
  def show
    @business = current_business
    @deals = 0
    @referrals = 0
    @promoters = current_business.promoters.size

    @subheader = true
    @subheader_right_action = {
      path:  edit_business_registration_path,
      text: "",
      icon: "ui-btn-right ui-icon-edit ui-btn-icon-notext ui-corner-all"
    }
  end
end
