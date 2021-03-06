require 'rails_helper'
require_relative '../spec_helpers/omniauth_helper'

describe "Facebook login" do
  context "brand new user" do
    before :each do
      valid_facebook_login_setup
      visit new_user_session_path
      click_on "Sign in with Facebook"
    end

    it "successfully logs in using Facebook" do
      expect(page).to have_content "John Doe"
    end

    it "creates a new user" do
      expect(User.count).to eq 1
    end
  end

  context "existing email user" do
    before :each do
      User.create(email: "test@example.com", password:"123456")
      expect(User.last.email).to eq "test@example.com"
      valid_facebook_login_setup
      visit new_user_session_path
      click_on "Sign in with Facebook"
    end

    it "does not create a new user" do
      expect(User.count).to eq 1
    end

    it "successfully logs in the preexisting user" do
      expect(page).to have_content "John Doe"
    end

    it "assigns their name from their FB info" do
      expect(page).to have_content "John Doe"
    end

    it "adds their FB auth info" do
      expect(User.last.provider).to eq "facebook"  
      expect(User.last.uid).to eq "123545"
    end

    it "doesn't set a new password" do
      click_on "Log Out"
      click_on "Log In"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
      expect(page).to have_content "John Doe"
    end
  end
  
  context "new email user for existing facebook user" do
    xit "confirms that they want to create and link accounts; sets a new password; can log in with FB or PW" do
      
    end
  end

end