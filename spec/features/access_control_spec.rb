require 'rails_helper'

describe "Access Control" do
  context "guests" do    
    it "cannot create a deal" do
      visit new_deal_path
      expect(current_path).to include "sign_in"
    end

    it "cannot edit a deal" do
      Deal.create(headline:"Sample Deal")
      visit edit_deal_path Deal.first
      expect(current_path).to include "sign_in"
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

  context "users" do
    before :each do
      create_and_log_in_user
    end

    it "displays an error and redirects back when attempting to access new deal page" do
      visit deals_path
      visit new_deal_path
      expect(current_path).to eq deals_path
      expect(page).to have_content "Non-admin users cannot create deals"
    end

    it "displays an error and redirects back when attempting to access edit deal page" do
      Deal.create(headline:"Sample Deal 1", description:"Sample description").tap do |deal|
        deal.origin = Airport.iata("DCA")
        deal.destination = Airport.iata("CDG")
        deal.start_date = Date.yesterday
        deal.end_date = Date.tomorrow
      end

      visit deals_path
      visit edit_deal_path Deal.first
      expect(current_path).to eq deals_path
      expect(page).to have_content "Non-admin users cannot edit deals"
    end

    it "cannot create a deal" do
      visit deals_path
      visit new_deal_path
      expect(current_path).to_not eq new_deal_path
      # expect(current_path).to include "sign_in"
    end

    it "cannot edit a deal" do
      Deal.create(headline:"Sample Deal")
      visit edit_deal_path Deal.first
      expect(current_path).to_not eq new_deal_path
      # expect(current_path).to include "sign_in"
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
end