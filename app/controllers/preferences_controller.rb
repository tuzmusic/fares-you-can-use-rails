class PreferencesController < ApplicationController

  before_action do
    set_prefs
  end
  def index
  end

  def edit
    @selected_vacation = @prefs.vacations.find(params[:vacation_id])
  end

  def update
    raise params
  end

  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

end
