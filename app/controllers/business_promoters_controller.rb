class BusinessPromotersController < ApplicationController
  before_action :set_business_promoters, only: [:index]

  def index
    @header_title = "Promoters"
    @subheader = true
    @subheader_left_action = {
      path: business_promoters_new_path,
      text: "",
      icon: "i-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }
  end

  def new
    @deal_type = BusinessPromoter.new

    # presentation
    @header_title = "Search promoter"
    @back_path = business_promoters_index_path
    @subheader = true
    @subheader_left_action = {
      path: business_promoters_search_path,
      text: "Search",
      icon: "ui-btn-right ui-icon-fa-search ui-btn-icon-notext ui-corner-all"
    }

    if params[:city_id]
      @city = City.find(params[:city_id])
    else
      @city = current_business.city
    end

    @promoters = Promoter.where(city_id: @city.id)
    p @promoters
  end

  def city_list
    @back_path = business_promoters_new_path
    @city_list = City.order(:name)
  end

  def search

  end

  private

  def set_business_promoters
    @business_promoters = current_business.promoters
  end
end
