require 'rails_helper'

describe "Log Out" do
  it "logs out a user if a user is logged in" do
    create_and_log_in_user
    click_on "Log Out"
    expect(page).to have_content "Log In"
    expect(page).to have_content "Sign Up"
    expect(page).to_not have_content "Log Out"
  end

  it "logs out an admin if an admin is logged in" do
    click_on "Log Out"
    create_and_log_in_admin
    click_on "Log Out"
    expect(page).to have_content "Log In"
    expect(page).to have_content "Sign Up"
    expect(page).to_not have_content "Log Out"
    expect(page).to_not have_content "Admin"
    
    create_and_log_in_user
    expect(page).to_not have_content "Admin"
  end
end