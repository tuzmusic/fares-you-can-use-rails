class Users::PreferencesController < Devise::OmniauthCallbacksController

  def index
    @user = current_user
  end

  def edit
    @user = current_user
    @selected_vacation = @user.vacations.find(params[:vacation_id])
    # render :index
  end

end
