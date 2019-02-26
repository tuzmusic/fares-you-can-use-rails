class Api::DealsController < ApplicationController
  def index
    render "Hello"
  end
  
  def show
    render json: Deal.find(params[:id])
  end
end