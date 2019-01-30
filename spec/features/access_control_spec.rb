require 'rails_helper'
require_relative '../spec_helpers/omniauth_helper'

describe "Access Control" do
  context "guest" do    
    it "prohibits guests from creating a deal" do
      visit new_deal_path
      expect(page).to have_content "Log in"
    end

    it "prohibits guests from editing a deal" do
      Deal.create(headline:"Sample Deal")
      visit edit_deal_path Deal.first
      expect(page).to have_content "Log in"
    end

    it "allows guests to access the deals page" do
      visit deals_path
      expect(page).to have_content "Deals"
      expect(page).to have_content "Sign In"
      expect(page).to have_content "Sign Up"
    end
  end
end