class DealsController < ApplicationController

  # before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]
  before_action :set_deal, only: [:show, :edit, :update, :destroy]


  def set_deal
    param = params[:slug] || params[:id]  # deal_path gives deal in p[slug], region_deal_path gives deal in p[id]
    @deal = Deal.find_by slug: param
  end

  def index
    if region_slug = params[:region_slug]
      @region = Region.find_by(slug: region_slug)
      @deals = @region.deals.current.order(:start_date)
      render :region_index
    else
      real_deals = Deal.where.not(posted_date: nil)
      grouped = real_deals.group_by(&:posted_date) 
      @deals = grouped
    end
  end  

  def show
    # binding.pry
  end

  def new
    @deal = Deal.new
  end

  def create
    # binding.pry
    deal = Deal.create(deal_params)
    deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
    deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]
    redirect_to deal_path(deal)
    # TO DO: error handling (if Deal.create(deal_params)...)
  end

  def edit
  end
  
  def update
    @deal.update(deal_params)
    @deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
    @deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]

    redirect_to deal_path(@deal)
    # TO DO: error handling (if Deal.update(deal_params)...)
  end

  def destroy
    @deal.destroy
    redirect_to deals_path
  end

  private

  def deal_params
    params.require(:deal).permit :headline, :description, :start_date, :end_date, :instructions, origin_ids:[], destination_ids:[], links_attributes: [:text, :url]
  end
end
