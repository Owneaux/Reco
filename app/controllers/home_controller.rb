class HomeController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @header_title = "Today's referrals"
    @referrals_total = 0
  end

  def check_out_referrals
    p 'asdadasd'
    render nothing: true, status: 200
  end

  private
    def set_business_promoters
      @business_promoters = current_business.promoters
    end
end