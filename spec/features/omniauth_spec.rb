require 'rails_helper'
require_relative '../spec_helpers/omniauth_helper'

describe "Facebook login" do
  before :each do
    valid_facebook_login_setup
    # get "auth/facebook/callback"
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "successfully logs in using Facebook" do
    visit root_path
    click_on "Sign in with Facebook"
    binding.pry
  end
end