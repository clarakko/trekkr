require "rails_helper"

feature "users sees all treks", %{
  As an unauthenticated user
  I can see an index of treks
  So that I can decide which treks to participate in.

  Acceptance Criteria:
  - [ ] I can see title of the trek
  - [ ] I can see location of the trek
} do
  let!(:trek) { FactoryGirl.create(:trek)}

  scenario "unauthenticated user sees list of treks" do
    visit root_path
    expect(page).to_not have_content(trek.title)
    click_on "Treks"
    expect(page).to have_content(trek.title)
    expect(page).to have_content(trek.location)
  end

  scenario "authenticated user sees list of treks" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Login", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_on "Treks"
    expect(page).to have_content(trek.title)
  end
end
