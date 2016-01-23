require "rails_helper"

feature "users sees all treks", %{
  As an unauthenticated user
  I can see an index of treks
  So that I can decide which treks to participate in.

  Acceptance Criteria:
  - [X] I can see title of the trek
  - [X] I can see location of the trek
} do
  let!(:trek) { FactoryGirl.create(:trek) }

  scenario "unauthenticated user sees list of treks" do
    visit root_path
    expect(page).to_not have_content(trek.title)
    click_on "Treks"
    expect(page).to have_content(trek.title)
    expect(page).to have_content(trek.location)
  end

  scenario "authenticated user sees list of treks" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on "Treks"
    expect(page).to have_content(trek.title)
  end
end
