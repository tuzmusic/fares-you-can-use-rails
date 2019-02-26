class Api::AirportsController < ApplicationController
  def index
    render json: Airport.all
  end

  def show
    @airport = Airport.iata(params[:slug])
    render json: @airport
  end
end