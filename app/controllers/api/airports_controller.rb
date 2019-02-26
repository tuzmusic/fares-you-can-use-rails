class Api::AirportsController < ApplicationController
  def index
    render json: Airport.all
  end

  def show
    @airport = Airport.find(params[:id])
    render json: @airport
  end
end