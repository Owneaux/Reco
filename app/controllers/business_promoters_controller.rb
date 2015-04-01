class BusinessPromotersController < ApplicationController

  before_action :set_promoter_data, only: [:show, :payment]

  def new
    @header_title = "Add Promoter"
    @back_path = home_index_path

    @promoters = Promoter
          .joins('LEFT JOIN business_promoters ON promoters.id = business_promoters.promoter_id')
          .where(business_promoters: {id: nil}).order(:name)
  end

  def show
    @back_path = home_index_path
    @header_title = @promoter.name
  end

  def payment
    @back_path = business_promoters_path
  end

  def checkout_payment
    promoter = Promoter.find(params[:promoter_id])
    payment = Payment.create(
      amount: params[:amount],
      what_for: params[:what_for]
      )
    payment.business = current_business
    payment.promoter = promoter
    if payment.save
      redirect_to business_promoters_path(promoter)
    else
      # TODO
    end
  end

  def history
    @deals = Deal.where(promoter_id: params[:id], business_id: current_business.id)
    @payments = Payment.where(promoter_id: params[:id], business_id: current_business.id)

    @back_path = business_promoters_path
  end

  def destroy
    business_promoter_rcd = BusinessPromoter.where(promoter_id: params[:id]).where(business_id: current_business.id)
    if business_promoter_rcd.size > 0
        business_promoter = business_promoter_rcd.first
        deals = Deal.where(promoter_id: business_promoter.promoter_id, business_id: current_business.id)
        p 'deals: ' + deals.size.to_s
        deals.each do |deal|
          deal.destroy
        end
        payments = Payment.where(promoter_id: business_promoter.promoter_id, business_id: current_business.id)
        payments.each do |payment|
          payment.destroy
        end
        business_promoter.destroy

        redirect_to home_index_path
    end
  end

  def create
    @business_promoter = BusinessPromoter.create(
      business_id: current_business.id,
      promoter_id: params[:promoter_id]
    )
    respond_to do |format|
      if @business_promoter.save
        format.html { redirect_to home_index_path }
      else
        # TODO send error
      end
    end
  end

  private
    def set_promoter_data
      @promoter = Promoter.find(params[:id])
      @referrals = Deal.where(business_id: current_business.id, promoter_id: @promoter.id).sum(:referrals)
      payments = Payment.where(business_id: current_business.id, promoter_id: @promoter.id).sum(:amount)
      @credit = @referrals - payments
    end

    def payment_params
      params.require(:payment).permit(:amount, :what_for, :promoter_id)
    end
end
