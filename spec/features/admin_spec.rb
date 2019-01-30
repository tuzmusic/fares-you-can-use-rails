require 'rails_helper'

describe "Admin" do
  describe "admin resource" do
    it "can be created" do
      create_admin
      expect(Admin.count).to eq 1 
    end
  end

  describe "logging in" do
    it "allows an admin to log in from /admin" do
      visit '/admin'
      expect(page).to have_field "Email"
    end    

    it "does not allow an admin to be created from the website" do
      visit '/admin/new'
      expect(page).to have_content 'No route matches [GET] "/admin/new"'
    end

    it "redirects to the admin portal" do
      create_and_log_in_admin
      expect(page).to have_content "Admin Portal"
    end

    it "allows an existing admin to use facebook to log in" do
      create_admin
      visit '/admin'
      click_link "Facebook"
      expect(page).to have_content "Admin Portal"
    end

    it "does not allow facebook login for someone who isn't an admin" do
      visit '/admin'
      click_link "Facebook" # don't need to create user because facebook login succeeds automatically in test mode
      expect(current_path).to eq new_user_session_path 
    end
  end

  describe "Admin Portal (/admin/deals, probably)" do
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
    
  end

  def log_in_admin
    
  end

  def create_and_log_in_admin
    create_admin
    log_in_admin
  end
end