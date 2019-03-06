class Api::UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def show
    if id = params[:id]
      render json: User.find(id)
    elsif current_user
      render json: current_user
    end
  end
  
  def deals
    if id = params[:id]
      render json: User.find(id).deals
    elsif current_user
      render json: current_user.deals
    end
  end

  def favorites
    if id = params[:id]
      render json: User.find(id).preferences.favorites
    elsif current_user
      render json: current_user.preferences.favorites
    end
  end

  before_action :get_user, only: [:add_airport, :delete_airport, :add_vacation, :delete_vacation]

  def get_user
    @user = User.find(params[:user_id])
  end

  def add_airport
    airport = Airport.iata(params[:iata])
    @user.preferences.home_airports << airport unless @user.home_airports.include? airport
    render json: @user.home_airports
  end

  def delete_airport
    airport = Airport.find(params[:airport_id])
    @user.preferences.home_airports.delete airport
    render json: @user.home_airports
  end

  def add_vacation
    vacation_params = params.require(:vacation).permit :name, :start_date, :end_date
    @user.preferences.vacations.create(vacation_params)
    render json: @user
  end

  def delete_vacation
    vacation = Vacation.find(params[:vacation_id])
    @user.preferences.vacations.delete vacation
    render json: @user
  end

  def add_favorite
    # TO-DO!
  end

  def add_region
    # TO-DO!
  end
end