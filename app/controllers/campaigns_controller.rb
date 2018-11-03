class CampaignsController < ApplicationController
  before_action :set_company
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = @company.campaigns.build
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = @company.campaigns.build(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to company_path(@campaign.company), notice: 'Campaign was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update_params(campaign_params)
        format.html { redirect_to company_path(@campaign.company), notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@campaign.company), notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = @company.campaigns.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :goald, :description, :start_date, :end_date, :company_id)
    end
end
