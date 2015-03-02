class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    @subheader = true
    @header_title = "Deals"
    @subheader_left_action = {
      path: new_deal_path,
      text: "",
      icon: "ui-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }
  end

  def deal_types
    @deal_types = current_business.deal_types
    @subheader = true
    @header_title = "Deal type"
    @back_path = new_deal_path
    @subheader_left_action = {
      path: new_deal_type_path,
      text: "",
      icon: "ui-btn-right ui-icon-fa-plus ui-btn-icon-notext ui-corner-all"
    }
  end

  def promoters
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    @back_path = deals_path

    if params[:deal_type_id]
      @deal_type = DealType.find(params[:deal_type_id])
    end

    if @deal_type.nil?
      @deal_type = current_business.deal_types.first
    end

    if @deal_type
      @deal_type_id = @deal_type.id
      @deal_type_name = @deal_type.name
    else
      @deal_type_id = ""
      @deal_type_name = "Add a new deal type"
    end

    if params[:promoter_id]
      @promoter = Promoter.find(params[:promoter_id])
    end

    if @promoter.nil?
      @promoter = current_business.promoters.first
    end

    if @promoter
      @promoter_id = @promoter.id
      @promoter_name = @promoter.name
      @promoter_picture = @promoter.picture
    else
      @promoter_id = ""
      @promoter_name = "Add a new promoter"
    end

    @query_params = "?source_view=new_deal" +
                      "&promoter_id=" + @promoter_id.to_s +
                      "&deal_type_id=" + @deal_type_id.to_s
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:deal_type_id, :promoter_id, :business_id)
    end
end
