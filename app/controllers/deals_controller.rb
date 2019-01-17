class DealsController < ApplicationController
  def create
    Deal.create(deal_params)
    redirect_to deals_path
  end

  def update
    Deal.update(params[:id], deal_params)
    redirect_to deal_path(params[:id])
  end

  private

  def deal_params
    params.require(:deal).permit :headline, :description, :start_date, :end_date, :instructions, origin_ids:[], destination_ids:[]
  end
end
