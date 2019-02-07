class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true

  def pry
    binding.pry
  end

  def require_admin
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
