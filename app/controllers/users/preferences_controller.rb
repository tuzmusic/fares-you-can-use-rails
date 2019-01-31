class Users::PreferencesController < Devise::OmniauthCallbacksController

  def edit
    # binding.pry
    @user = current_user
  end

end
