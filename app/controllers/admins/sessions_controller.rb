# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController

  # NOTE - :authenticate_admin? doesn't work, BECAUSE (I think) all admin activity should be in Admin resource/controller/namespace/whatever, not here in Admin Sessions controller.
  
  before_action :require_admin, except: [:new]

  def portal
    @deals = Deal.all.order(posted_date: :desc)
  end
  
end
