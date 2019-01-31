require 'rails_helper'

describe "Edit Preferences view" do

  it "show's the user's vacations" do
    
  end

  it "can only be accessed by a logged in user" do
    visit edit_user_preferences_path
    expect(current_path).to eq user_sign_in_path 
  end
end