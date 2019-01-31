class VacationsController < ApplicationController
  def update
    # raise params
    vacation = Vacation.find(params[:id])
    vacation.update(vacation_params)
    redirect_to '/preferences'
  end

  def vacation_params
    params.require(:vacation).permit :name, :start_date, :end_date
  end
end