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

  def add_airport
    user = User.find(params[:user_id])
    airport = Airport.iata(params[:iata])
    user.preferences.home_airports << airport unless user.home_airports.include? airport
    render json: user.home_airports
  end

  def delete_airport
    user = User.find(params[:user_id])
    airport = Airport.find(params[:airport_id])
    user.preferences.home_airports.delete airport
    render json: user.home_airports
  end

  def add_vacation
    user = User.find(params[:user_id])
    vacation_params = params.require(:vacation).permit :name, :start_date, :end_date
    user.preferences.vacations.create(vacation_params)
    render json: user.vacations
  end

  def delete_vacation
    user = User.find(params[:user_id])
    vacation = Vacation.find(params[:vacation_id])
    user.preferences.vacations.delete vacation
    render json: user.vacations
  end



  def add_favorite
    
  end

  def add_region
    
  end
end