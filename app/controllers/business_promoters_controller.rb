class BusinessPromotersController < ApplicationController
  before_action :set_business, only: [:index]

  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end
  end
end
