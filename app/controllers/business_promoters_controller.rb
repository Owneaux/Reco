class BusinessPromotersController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @header_title = "Promoters"
    @subheader = true
    @subheader_left_action = {
      path: business_promoters_new_path,
      text: "",
      icon: "ui-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }
  end

  def new
    @header_title = "Search promoter"
    @back_path = business_promoters_index_path

    @promoters = Promoter
          .joins('LEFT JOIN business_promoters ON promoters.id = business_promoters.promoter_id')
          .where(business_promoters: {id: nil}).order(:name)

  end

  def create
    @business_promoter = BusinessPromoter.create(
      business_id: current_business.id,
      promoter_id: params[:promoter_id])

    respond_to do |format|
      if @business_promoter.save
        format.html { redirect_to business_promoters_index_path }
      else
        # TODO send error
      end
    end
  end

  private

  def set_business_promoters
    @business_promoters = current_business.promoters
  end
end
