require "rails_helper"

feature "authenticated user withdraws from challenge", %{
  As an authenticated user
  I can withdraw from challenges
  I do not wish to continue tracking

  Acceptance Criteria:
  - [ ] I can withdraw from the challenge show page
  - [ ] I no long see challenges on my dashboard from which I withdrew
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:challenge) { FactoryGirl.create(:challenge) }

  before(:each) do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_on "Challenges"
    click_on challenge.title
    click_link "Track this challenge!"
  end

  scenario "user withdraws from challenge show page" do
    click_link "My Challenges"
    click_on challenge.title
    click_link "Stop tracking this challenge."
    expect(page).to have_content "You are no longer tracking this challenge."

    click_link "My Challenges"
    expect(page).to_not have_content challenge.title

    click_link "Challenges"
    click_link challenge.title
    expect(page).to have_link "Track this challenge!"
  end
end
