require 'rails_helper'

describe "Admin" do
  describe "admin resource" do
    it "can be created" do
      create_admin
      expect(Admin.count).to eq 1 
    end
  end

  describe "advanced Devise implementation" do
    it "lives at /admin/sign_in" do
      visit '/admin/sign_in'
      expect(page).to have_field "Email"
    end
    
    it "has a custom login page" do
      visit new_admin_session_path
      expect(page).to have_content "Admin Log in"
    end

    it "doesn't replace the users path!!!" do
      visit new_user_session_path
      expect(current_path).to eq new_user_session_path  
    end
  end

  describe "logging in" do
    
    it "allows an admin to log in from /admin/sign_in" do
      visit '/admin/sign_in'
      expect(page).to have_field "Email"
    end    

    it "does not allow an admin to be created from the website" do
      expect{visit '/admins/new'}.to raise_error(ActionController::RoutingError)
    end

    it "redirects to the admin portal" do
      create_and_log_in_admin
      expect(current_path).to eq "/admin" 
      expect(page).to have_content "Admin Portal"
      expect(page).to have_content "John Doe (admin)"
    end

    it "shows a link to the admin portal in the nav bar" do
      create_and_log_in_admin
      expect(page).to have_link 'Admin', href: admin_root_path
    end

    it "doesn't show a link to the admin portal when a non-admin user is logged in" do
      create_and_log_in_user
      expect(page).to_not have_link 'Admin', href: admin_root_path
    end

    xit "allows an existing admin to use facebook to log in" do
      create_admin
      visit new_admin_session_path
      click_link "Facebook"
      expect(page).to have_content "Admin Portal"
    end

    xit "does not allow facebook login for someone who isn't an admin" do
      visit new_admin_session_path
      click_link "Facebook" # don't need to create user because facebook login succeeds automatically in test mode
      expect(current_path).to eq new_user_session_path 
    end
  end

  describe "Admin Portal" do
    before :each do
      Deal.import
      create_and_log_in_admin
    end

    it "lists all the deals" do
      expect(page.all('.deal').count).to eq Deal.count
    end

    xit "can sort deals by posted date" do
      expect(true).to eq false  
    end

    xit "can sort deals by start date" do
      expect(true).to eq false  
    end

    xit "can sort deals by region" do
      expect(true).to eq false  
    end

    it "has a link to create a deal" do
      expect(page).to have_link "New Deal", href: new_deal_path 
    end
  end
end
