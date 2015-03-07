class DealTypesController < ApplicationController

  before_action :set_deal_type, only: [:edit, :update]

  # GET /deal_type/edit
  def edit
    if @deal_type.nil?
      @deal_type = DealType.create(
        name: '',
        commission: 0.0,
        description: '',
        business_id: current_business.id
        )
      @deal_type.save
    end
    @header_title = "Deal"
    p @deal_type
  end

  def update
    @deal_type.update_attributes(deal_type_params)
    redirect_to home_index_path
  end

  private
    def set_deal_type
      @deal_type = current_business.deal_type
    end
    def deal_type_params
      params.require(:deal_type).permit(:name, :commission, :description)
    end
end
