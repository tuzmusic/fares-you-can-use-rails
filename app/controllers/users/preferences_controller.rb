class Users::PreferencesController < Devise::OmniauthCallbacksController

  def edit
    @user = current_user
  end

end
