class BusinessPromotersController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @header_title = "Promoters"
    @subheader = true
    @subheader_right_action = {
      path: business_promoters_new_path,
      text: "",
      icon: "ui-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }

    @subheader_left_action = {
      path: "",
      text: "Delete",
      icon: "ui-btn-left ui-icon-delete ui-btn-icon-notext ui-corner-all btn-delete-promoter"
    }
  end

  def new
    @header_title = "Search promoter"
    @back_path = business_promoters_index_path

    @promoters = Promoter
          .joins('LEFT JOIN business_promoters ON promoters.id = business_promoters.promoter_id')
          .where(business_promoters: {id: nil}).order(:name)
  end

  def show
    @back_path = business_promoters_index_path
    promoter = Promoter.find(params[:id])
    @header_title = promoter.name
    @deals = Deal.where(promoter_id: params[:id])
    p @deals
  end

  def checkout
    deal_id = params[:id]
    if deal_id
      deal = Deal.find(params[:id])
      deal.paid = true
      deal.paid_at = Time.now
      deal.save
    end

    render nothing: true, status: 200
  end

  def destroy
    business_promoter_rcd = BusinessPromoter.where(promoter_id: params[:id]).where(business_id: current_business.id)
    if business_promoter_rcd.size > 0
        business_promoter = business_promoter_rcd.first
        business_promoter.destroy
        render nothing: true, status: 200
    end
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
