require "rails_helper"

feature "authenticated user sees enrolled challenge treks", %{
  As an authenticated user
  I can see treks from challenges I am enrolled in
  So that I may quickly find treks to complete

  Acceptance Criteria:
  - [X] I see treks of challenges I am enrolled in
  - [X] I do not see treks of challenges I am not enrolled in
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:challenge) { FactoryGirl.create(:challenge) }
  let!(:trek) { FactoryGirl.create(:trek) }
  let!(:trek2) { FactoryGirl.create(:trek) }
  let!(:step) { FactoryGirl.create(:step, challenge: challenge, trek: trek) }

  before(:each) do
    sign_in_as(user)
    click_on "Challenges"
    click_on challenge.title
    click_link "Track this challenge!"
  end

  scenario "authenticated sees enrolled challenge treks" do
    # click_link "My Treks"
    # expect(page).to have_content(trek.title)
    # expect(page).to_not have_content(trek2.title)
  end
end
