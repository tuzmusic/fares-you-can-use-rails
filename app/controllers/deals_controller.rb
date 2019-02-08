class DealsController < ApplicationController

  # before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show, :my_deals]
  before_action :authenticate_user!, only: :my_deals
  before_action :set_deal, only: [:show, :edit, :update, :destroy]


  def set_deal
    @deal = Deal.find_by slug: params[:slug] if params[:slug]
    @deal = Deal.find_by id: params[:id] if params[:id]
  end

  def my_deals
  end

  def index
    @vacations = current_user&.vacations if params[:filter]
    if region_slug = params[:region_slug]
      @region = Region.find_by(slug: region_slug)
      @deals = @region.deals.current.order(:start_date)
      render :region_index
    else
      @deals = Deal.group_by_posted
    end
  end  

  def show
    if region_slug = params[:region_slug]
      @region = Region.find_by(slug: region_slug)
    end    
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.create(deal_params)
    @deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
    @deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]

    if @deal.valid?
      @deal.save
      redirect_to deal_path(@deal)
    else 
      render :new
    end
  end

  def edit
  end
  
  def update
    @deal.update(deal_params)
    if @deal.valid?
      @deal.origin_codes = params[:deal][:origins] if params[:deal][:origins]
      @deal.destination_codes = params[:deal][:destinations] if params[:deal][:destinations]
      redirect_to deal_path(@deal)
    else
      render :edit
    end
    # TO DO: error handling (if Deal.update(deal_params)...)
  end

  def destroy
    @deal.destroy
    redirect_to deals_path
  end

  private

  def deal_params
    params.require(:deal).permit :headline, :description, :start_date, :end_date, :instructions, origin_ids:[], destination_ids:[], links_attributes: [:text, :url, :id, :_destroy]
  end
end
