require 'rails_helper'

describe "Basic Access Control" do
  context "guests" do    
    it "cannot create a deal" do
      visit new_deal_path
      expect(current_path).to eq new_admin_session_path
    end

    it "cannot edit a deal" do
      Deal.create(headline:"Sample Deal")
      visit edit_deal_path Deal.first
      expect(current_path).to eq new_admin_session_path
    end

    it "can access the deals index page" do
      Deal.create(headline:"Sample Deal 1")
      Deal.create(headline:"Sample Deal 2")      
      visit deals_path
      expect(page).to have_content "Sample Deal 1"
      expect(page).to have_content "Sample Deal 2"
    end

    it "can access the deals show page" do
      Deal.create(headline:"Sample Deal 1", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("CDG")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
      end
      visit deal_path Deal.first
      expect(page).to have_content "Sample Deal 1"
      expect(page).to have_content "Sample description"
    end

    it "can access the regions index page" do
      visit regions_path
      expect(page).to have_content "Africa"
    end

    it "can access the regions show page (region_deals index)" do
      Deal.create(headline:"Flight from Johannesburg", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("JNB")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
        deal.save
      end
      afr = Region.find_by(name:"Africa")
      visit region_deals_path afr
      expect(page).to have_content "Flight from Johannesburg"
    end

    it "redirects presents admin login page when trying to visit an admin page" do
      visit admin_root_path
      expect(current_path).to eq new_admin_session_path 
    end
  end

  context "users" do
    before :each do
      create_and_log_in_user
    end

    it "displays admin login page when trying to access deals#new" do
      visit deals_path
      visit new_deal_path
      expect(current_path).to eq new_admin_session_path
    end

    it "displays admin login page when trying to access deals#edit" do
      Deal.create(headline:"Sample Deal 1", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("CDG")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
      end

      visit regions_path
      visit edit_deal_path Deal.first
      expect(current_path).to eq new_admin_session_path
    end

    it "doesn't log out if a forbidden action is attempted" do
      visit deals_path
      visit new_deal_path
      expect(current_path).to eq new_admin_session_path
      expect(page).to have_content "John Doe"
    end

    it "can access the deals index page" do
      Deal.create(headline:"Sample Deal 1")
      Deal.create(headline:"Sample Deal 2")      
      visit deals_path
      expect(page).to have_content "Sample Deal 1"
      expect(page).to have_content "Sample Deal 2"
    end

    it "can access the deals show page" do
      Deal.create(headline:"Sample Deal 1", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("CDG")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
      end
      visit deal_path Deal.first
      expect(page).to have_content "Sample Deal 1"
      expect(page).to have_content "Sample description"
    end

    it "can access the regions index page" do
      visit regions_path
      expect(page).to have_content "Africa"
    end

    it "can access the regions show page (region_deals index)" do
      Deal.create(headline:"Flight from Johannesburg", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("JNB")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
        deal.save
      end
      afr = Region.find_by(name:"Africa")
      visit region_deals_path afr
      expect(page).to have_content "Flight from Johannesburg"
    end
  end

  context "admins" do
    before :each do
      create_and_log_in_admin
    end

    it "can access the new deals page" do
      visit new_deal_path
      expect(page).to have_field "Headline"
    end

    it "can access the edit deals page" do
      Deal.create(headline:"Sample Deal 1", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("CDG")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
      end
  
      visit edit_deal_path Deal.first
      expect(page).to have_content "Sample description"
    end
  end

end

describe "access control routes" do
  it "uses '/sign_in' for login" do
    visit user_sign_in_path
    expect(current_path).to eq '/sign_in' 
    expect(page).to have_content "Log in"
  end

  it "uses /sign_out' for logout" do
    # visit user_sign_out_path
    visit '/sign_out' 
    expect(page).to have_content "Signed out successfully."
  end

  it "uses /sign_up' for registration" do
    visit user_sign_up_path
    expect(current_path).to eq '/sign_up' 
    expect(page).to have_field "Password confirmation"
  end
end