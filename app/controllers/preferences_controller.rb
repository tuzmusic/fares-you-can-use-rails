class PreferencesController < ApplicationController

  before_action do
    set_prefs
  end

  def show
  end

  def edit
  end

  def update
    add_home_airport(params) if params[:preference][:home_airport]
    # @prefs.update(pref_params)
    pref_params[:vacations_attributes].each do |array|  
      vacation = array.last
      binding.pry
      if vacation[:_destroy] == 1
        Vacation.find(vacation[:id]).destroy
      end
    end
    redirect_to preferences_path
  end
  
  def destroy
    @prefs.home_airports.delete(params[:airport_id])
    redirect_to preferences_path
  end

  def add_home_airport(params)
    airport = params[:preference][:home_airport]
    if airport[3] == " " && valid_airport = Airport.iata(airport[0..2])
      @prefs.home_airports << valid_airport 
    else
      flash[:notice] = "#{airport} is not a valid airport."
    end
  end

  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

  def pref_params
    params.require(:preference).permit region_ids: [], vacations_ids:[], vacations_attributes: [:name, :start_date, :end_date, :id, :_destroy]
  end
end
