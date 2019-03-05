class Api::DealsController < ApplicationController
  def index
    render json: Deal.all.order(posted_date: :desc)
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
  
  def for_vacation
    if id = params[:id]
      vacation = Vacation.find(id)
    elsif start_date = params[:start_date] && end_date = params[:end_date]
      # parse dates however they come in
      # create vacation with those dates
    end
    render json: Deal.for_vacation(vacation)
  end
end