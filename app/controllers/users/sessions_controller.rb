# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # NOTE - :authenticate_admin? doesn't work, BECAUSE (I think) all admin activity should be in Admin resource/controller/namespace/whatever, not here in Admin Sessions controller.
  
  def new
    sign_out if admin_signed_in?
    super
  end
  
end
