class VacationsController < ApplicationController
  before_action :set_vacation

  def update
    @vacation.update(vacation_params)
    redirect_to preferences_path
  end

  def set_vacation
    @vacation = Vacation.find(params[:id])
  end

  def vacation_params
    params.require(:vacation).permit :name, :start_date, :end_date
  end
end
