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
    add_home_airport(params)
    @prefs.update(pref_params)
    redirect_to preferences_path
  end
  
  def destroy
    @prefs.home_airports.delete(params[:airport_id])
    redirect_to preferences_path
  end

  def add_home_airport(params)
    if airport = params[:preferences][:home_airport]
      if airport[3] == " " && valid_airport = Airport.iata(airport[0..2])
        @prefs.home_airports << valid_airport 
      else
        flash[:notice] = "#{airport} is not a valid airport."
      end
    end
  end
  
  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

  def pref_params
    params.require(:preferences).permit region_ids: [], vacation_ids:[], vacation_attributes: [:name, :start_date, :end_date]
  end

end
