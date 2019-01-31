class VacationsController < ApplicationController
  def update
    vacation = Vacation.find(params[:id])
    redirect_to '/preferences'
  end
end