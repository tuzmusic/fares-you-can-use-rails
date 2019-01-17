class ApplicationController < ActionController::Base

  def require_login
    redirect_to signin_path unless current_user
  end

  def require_admin
    begin
      head 403 unless current_user&.admin?
    rescue => exception
      true
    end
  end

  def current_user
    begin
      User.find(session[:user_id])
    rescue => exception
      true
    end
  end
end
