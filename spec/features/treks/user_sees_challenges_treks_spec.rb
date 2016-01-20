require "rails_helper"

feature "users sees challenge's treks", %{
  As an unauthenticated user
  I can view a challenges treks
  So that I can see how to complete a challenge

  Acceptance Criteria:
  - [ ] I can see an index of challenge treks on challenge show page
  - [ ] I can see a title, and location of the trek
} do
  let!(:challenge) { FactoryGirl.create(:challenge) }
  let!(:trek) { FactoryGirl.create(:trek)}
  let!(:step) { FactoryGirl.create(:step, challenge: challenge, trek: trek)}

  scenario "unauthenticated user sees list of challenge's treks" do
    visit root_path
    click_link "Challenges"
    click_link challenge.title
    expect(page).to have_content(challenge.description)
    expect(page).to have_content(trek.title)
    expect(page).to have_content(trek.location)
  end
end
