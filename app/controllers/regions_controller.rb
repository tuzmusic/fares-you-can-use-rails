class RegionsController < ApplicationController
  before_action :set_region, only: [:show]

  def index
    @regions = Region.all.by_most_deals
    # binding.pry
  end

  def show
  end

  def set_region
    @region = Region.find_by slug: params[:slug]
  end
end
