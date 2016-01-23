require "rails_helper"

feature "user updates information", %{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date

  Acceptance Criteria
  [x] I will be able to update from the Settings page if I am authenticated
  [x] I can leave any field blank that I do not wish to change
  [x] I cannot change any field without entering my current password
  [x] I must confirm my new password if I wish to change my password
} do

  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
    click_on "Settings"
  end

  scenario "authenticated user goes to settings page" do
    expect(page).to have_content("Edit User")
  end

  scenario "User changes one field only" do
    fill_in "Email", with: "changes@gmail.com"
    fill_in "Current password", with: user.password
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "User fails to enter current password" do
    fill_in "Email", with: "changes@gmail.com"
    click_button "Update"
    expect(page).to have_content("Current password can't be blank")
  end

  scenario "User fails to confirm new password" do
    fill_in "Password", with: "NewPassword"
    fill_in "Current password", with: user.password
    click_button "Update"
    expect(page).to have_content("Password confirmation doesn't match")
  end
end
