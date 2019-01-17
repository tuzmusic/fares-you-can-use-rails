class ApplicationController < ActionController::Base
  
  def current_user
    begin
      User.find(session[:user_id])
    rescue => exception
      true
    end
  end

  def admin_user
    begin
      current_user&.admin?
    rescue => exception
      true
    end
  end
end
