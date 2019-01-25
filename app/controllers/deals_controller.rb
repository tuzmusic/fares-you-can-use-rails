class DealsController < ApplicationController

  before_action :require_admin, only: [:new, :create, :update, :destroy]

  def index
    real_deals = Deal.where.not(posted_date: nil) # TODO - destroy some deals!
    grouped = real_deals.group_by(&:posted_date) 
    @deals = grouped
  end  

  def show
    @deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
  end

  def create
    deal = Deal.create(deal_params)
    deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
    deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]
    redirect_to deal_path(deal)
    # TO DO: error handling (if Deal.create(deal_params)...)
  end

  def edit
    @deal = Deal.find(params[:id])
  end
  
  def update
    deal = Deal.find(params[:id])
    deal.update(deal_params)
    deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
    deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]

    redirect_to deal_path(params[:id])
    # TO DO: error handling (if Deal.update(deal_params)...)
  end

  def destroy
    deal = Deal.find(params[:id])
    deal.destroy
    redirect_to deals_path
  end

  private

  def deal_params
    params.require(:deal).permit :headline, :description, :start_date, :end_date, :instructions, origin_ids:[], destination_ids:[]
  end
end
