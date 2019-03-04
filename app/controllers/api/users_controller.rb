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

  def vacation_deals
    if current_user


      
    else
      render status: 500
    end
  end
end