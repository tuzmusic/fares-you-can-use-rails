class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true

  def pry
    binding.pry
  end

  def require_admin
    unless admin_signed_in?
      flash[:notice] = "Admin access is required for that action."
      redirect_to root_path
    end    
  end
end
