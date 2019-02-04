class PreferencesController < ApplicationController

  before_action do
    set_prefs
  end

  def show
  end

  def edit
    raise params
  end

  def update
    @prefs.update(pref_params)
    redirect_to :index
  end

  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

  def pref_params
    params.require(:preference).permit vacation_ids:[], vacation_attributes: [:name, :start_date, :end_date]
  end

end
