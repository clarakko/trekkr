require "rails_helper"

feature "authenticated user joins challenge", %{
  As an authenticated user
  I can join an individual challenge
  So that I may participate in the challenge

  Acceptance Criteria:
  - [X] I am unauthenticated and invited to sign up if I try to join
  - [ ] I am authenticated and join the challenge from challenge show page
  - [ ] I am able to see which challenges I joined if I visit my dashboard
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
  end

  scenario "unauthenticated user invited to sign up" do
    click_on "Sign Out"
    click_on "Challenges"
    click_on challenge.title
    click_link "Track this challenge!"
    expect(page).to have_content("You need to sign in or sign up")
  end

  scenario "authenticated user joins individual challenge" do
    click_link "Track this challenge!"
    expect(page).to have_content("Challenge joined!")
    expect(page).to_not have_link "Track this challenge!"
  end

  scenario "authenticated user sees joined challenges" do
    click_link "Track this challenge!"
    click_link "My Challenges"
    expect(page).to have_content(challenge.title)
  end
end
