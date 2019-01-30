require 'rails_helper'

describe "Admin" do
  describe "admin resource" do
    it "can be created" do
      create_admin
      expect(Admin.count).to eq 1 
    end
  end

  describe "advanced Devise implementation" do
    xit "lives at /admin" do
      visit '/admin'
      expect(page).to have_field "Email"
    end
    
    xit "has a custom login page" do
      visit new_admin_session_path
      expect(page).to_not have_content "Sign up"
    end

    it "doesn't replace the users path!!!" do
      visit new_user_session_path
      expect(current_path).to eq new_user_session_path  
    end
  end

  describe "logging in" do
    
    it "allows an admin to log in from /admins" do
      visit new_admin_session_path
      expect(page).to have_field "Email"
    end    

    it "does not allow an admin to be created from the website" do
      expect{visit '/admins/new'}.to raise_error(ActionController::RoutingError)
    end

    it "redirects to the admin portal" do
      create_and_log_in_admin
      expect(current_path).to eq "/deals" 
      # expect(page).to have_content "Admin Portal"
    end

    it "allows an existing admin to use facebook to log in" do
      create_admin
      visit new_admin_session_path
      click_link "Facebook"
      expect(page).to have_content "Admin Portal"
    end

    it "does not allow facebook login for someone who isn't an admin" do
      visit new_admin_session_path
      click_link "Facebook" # don't need to create user because facebook login succeeds automatically in test mode
      expect(current_path).to eq new_user_session_path 
    end
  end

  describe "Admin Portal (/admins/deals, probably)" do
    before :each do
      create_and_log_in_admin
    end

    it "has a link to create a deal" do
      expect(page).to have_link "Create Deal"  
    end

    it "lists all the deals" do
      expect(true).to eq false  
    end

    it "can sort deals by posted date" do
      expect(true).to eq false  
    end

    it "can sort deals by start date" do
      expect(true).to eq false  
    end

    it "can sort deals by region" do
      expect(true).to eq false  
    end

    it "cannot be accessed by guests" do
      expect(true).to eq false  
    end

    it "cannot be accessed by non-admin users" do
      expect(true).to eq false  
    end
  end
  
  def create_admin
    Admin.create(email: "test@example.com", password:"123456")
  end

  def log_in_admin
    visit new_admin_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
  end

  def create_and_log_in_admin
    create_admin
    log_in_admin
  end
end