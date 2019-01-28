class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true

  def pry
    binding.pry
  end

  def require_login
    redirect_to signin_path unless current_user
  end

  def require_admin
    begin
      head 403 unless current_user&.admin?
    rescue => exception
      true
      # head 403
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
