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
    if airport = params[:preferences][:home_airport]
      if iata = airport[0..2]
        @prefs.home_airports << Airport.iata(iata) if Airport.iata(iata)
      end
    end
    @prefs.update(pref_params)
    redirect_to preferences_path
  end

  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

  def pref_params
    # params.require(:preferences).permit vacation_ids:[], vacation_attributes: [:name, :start_date, :end_date]
    params.require(:preferences).permit vacation_ids:[], vacation_attributes: [:name, :start_date, :end_date]
  end

end
