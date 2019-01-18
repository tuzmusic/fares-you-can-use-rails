class DealsController < ApplicationController

  before_action :require_admin, only: [:new, :create, :update, :destroy]

  def show
    @deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
  end

  def create
    Deal.create(deal_params)
    redirect_to deals_path
    # TO DO: error handling (if Deal.create(deal_params)...)
  end
  
  def update
    Deal.update(params[:id], deal_params)
    redirect_to deal_path(params[:id])
    # TO DO: error handling (if Deal.update(deal_params)...)
  end

  def destroy
    deal = Deal.find(params[:id])
    deal.destroy
  end

  private

  def deal_params
    params.require(:deal).permit :headline, :description, :start_date, :end_date, :instructions, origin_ids:[], destination_ids:[]
  end
end
