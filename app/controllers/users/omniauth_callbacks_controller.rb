class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook

    # TO-DO: Handle an existing user logging in via facebook.

    # http://localhost%3A3000/users/auth/facebook/callback

    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
