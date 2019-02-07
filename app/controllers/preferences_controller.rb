class PreferencesController < ApplicationController

  before_action do
    authenticate_user!
    set_prefs
  end

  def show
  end

  def edit
  end

  def update
    @prefs.update(pref_params)
    add_home_airport(params) if params[:preference][:home_airport]
    delete_vacations(pref_params) if pref_params[:vacations_attributes]
    redirect_to preferences_path
  end

  def new
  end

  def create # for adding vacations
    @vacation = Vacation.new(params.require(:vacation).permit :name, :start_date, :end_date) 
    @vacation.preference = @prefs
    if @vacation.valid?
      @vacation.save
      redirect_to preferences_path
    else
      render :new
    end
  end
  
  def destroy # for removing home airports
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

  def delete_vacations(params)
    pref_params[:vacations_attributes].each do |array|  
      vacation = array.last
      if vacation[:_destroy] == "1"
        Vacation.find(vacation[:id]).destroy
      end
    end    
  end

  def set_prefs
    @prefs = Preference.find_by(user_id: current_user.id)
  end

  def pref_params
    params.require(:preference).permit region_ids: [], vacations_ids:[], vacations_attributes: [:name, :start_date, :end_date, :id, :_destroy]
  end
end
