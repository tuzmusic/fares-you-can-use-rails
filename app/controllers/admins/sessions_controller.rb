# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController

  # NOTE - :authenticate_admin? doesn't work, BECAUSE (I think) all admin activity should be in Admin resource/controller/namespace/whatever, not here in Admin Sessions controller.
  
  before_action :require_admin, except: [:new]

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
