class Api::DealsController < ApplicationController
  def index
    render json: Deal.all
  end
  
  def show
    render json: Deal.find(params[:id])
  end
  
  def from_airport
    render json: Deal.from_airport(params[:iata])
  end
  
  def to_region
    region = Region.find_by(slug: params[:slug])
    render json: Deal.to_region(region)
  end
end