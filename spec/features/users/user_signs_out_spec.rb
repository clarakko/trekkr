require "rails_helper"

feature "authenticated user signs out", %{
  As an authenticated user
  I want to sign out
  So that my information is no longer retained by the app

  Acceptance Criteria
  [x] I do not see a "Sign Out" link if I am not authenticated
  [x] I am able to sign out if I am authenticated
} do

  let!(:user) { FactoryGirl.create(:user) }

  scenario "unathenticated visitor cannot see sign out link" do
    visit root_path
    expect(page).to_not have_content("Sign Out")
  end

  scenario "an authenticated user is able to sign out" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_link "Sign Out"
    expect(page).to have_content("Enjoy the fresh air!")
  end
end
