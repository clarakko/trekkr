require "rails_helper"

feature "users views single challenge", %{
  As an unauthenticated user
  I can view an individual challenge
  So that I can understand the nature of the challenge

  Acceptance Criteria:
  - [X] I can select a challenge from the index page
  - [X] I can see a title, tagline, and description of the challenge
  - [X] I am invited to sign up if I try to join the challenge
} do
  let!(:challenge) { FactoryGirl.create(:challenge) }
  let!(:challenge2) { FactoryGirl.create(:challenge) }

  before(:each) do
    visit root_path
    click_on "Challenges"
    click_on challenge.title
  end

  scenario "unauthenticated user sees individual challenge" do
    expect(page).to have_content(challenge.title)
    expect(page).to have_content(challenge.tagline)
    expect(page).to have_content(challenge.description)
    expect(page).to_not have_content(challenge2.title)
  end
end
