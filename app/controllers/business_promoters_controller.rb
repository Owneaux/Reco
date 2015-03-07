class BusinessPromotersController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @source_view = params[:source_view]

    @header_title = "Promoters"
    @subheader = true
    if @source_view == 'new_deal'
      @back_path = new_deal_path
    end
    @subheader_left_action = {
      path: business_promoters_new_path,
      text: "",
      icon: "ui-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }
    if params[:deal_type_id]
      @query_string = "?deal_type_id=" + params[:deal_type_id]
    else
      @query_string = "?"
    end
  end

  def new
    @deal_type = BusinessPromoter.new

    # presentation
    @header_title = "Search promoter"
    @back_path = business_promoters_index_path

    if params[:city_id]
      @city = City.find(params[:city_id])
    else
      @city = current_business.city
    end
    @promoters = Promoter
          .joins('LEFT JOIN business_promoters ON promoters.id = business_promoters.promoter_id')
          .where(city_id: current_business.city_id, business_promoters: {id: nil})
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

  def city_list
    @back_path = business_promoters_new_path
    @city_list = City.order(:name)
  end

  private

  def set_business_promoters
    @business_promoters = current_business.promoters
  end
end
