# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController

  def admin_auth
    # NOTE - This method is needed because :authenticate_admin? doesn't work, which is (I think) BECAUSE all admin activity should be in Admin resource/controller/namespace/whatever, not here in Admin Sessions controller.
    redirect_to new_admin_session_path unless admin_signed_in?
  end
  
  before_action :admin_auth, except: [:new]

  def portal
    @deals = Deal.all.order(posted_date: :desc)
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
