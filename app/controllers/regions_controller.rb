class RegionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_region, only: [:show]

  def index
    @regions = Region.all.by_most_deals
  end

  def show
    redirect_to region_deals_path(@region)
  end

  def set_region
    @region = Region.find_by slug: params[:slug]
  end
end
