# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show edit update destroy]

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def edit; end

  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaigns_path, notice: 'Campaign was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to campaigns_path, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_path, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :goald, :description, :start_date,
                                     :end_date, :company_id, :community_manager_id)
  end
end
