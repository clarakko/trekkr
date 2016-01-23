require "rails_helper"

feature "user deletes self", %{

  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

  Acceptance Criteria
  [x] I can delete my account
  [x] I can no longer sign in after deleting my account

} do

  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
    click_on "Settings"
  end

  scenario "authenticated user deletes their account" do
    click_on "Cancel my account"
    expect(page).to have_content("Bye! Your account has been successfully
    cancelled.")
  end

  scenario "User cannot login after account deleted" do
    click_on "Cancel my account"
    sign_in_as(user)
    expect(page).to have_content("Invalid email or password")
  end
end
