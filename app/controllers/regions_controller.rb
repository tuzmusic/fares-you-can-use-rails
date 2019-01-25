class RegionsController < ApplicationController
  before_action :set_region, only: [:show]

  def index
    @regions = Region.all
  end

  def show
  end

  def set_region
    @region = Region.find_by slug: params[:slug]
  end
end
