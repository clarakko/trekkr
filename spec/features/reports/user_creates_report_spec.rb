require "rails_helper"

feature "new user signs up", %{
  As an authenticated user
  I can add a trail report to a trek
  So that I can make progress on a challenge.

  Acceptance Criteria:
  - [X] I can add a trail report from the trek show page if I am authenticated
  - [X] I must specify a valid start date
  - [X] I can optionally specifiy valid start time
  - [X] I can optionally specify a valid end date
  - [X] I can optionally specify a valid end time
  - [X] I can optionally specify a duration
  - [X] I can optionally specify a valid distance
  - [X] I can optionally specify weather
  - [X] I can optionally specify trail conditions
  - [X] I can optionally specify trail difficulty between 1 - 10
  - [X] I can optionally make report public, otherwise it will remain private
  - [X] I get error messages if I do not perform the above
} do
  let!(:user) { FactoryGirl.create(:user) }
  # let!(:user2) { FactoryGirl.create(:user) }
  let!(:trek) { FactoryGirl.create(:trek) }
  let!(:report) { FactoryGirl.create(:report, user: user, trek: trek) }

  scenario "unauthenticated user cannot add report" do
    visit treks_path
    click_link trek.title
    click_link "Add Trail Report"
    expect(page).to have_content "You need to sign in or sign up"
  end

  scenario "authenticated user adds valid private report" do
    sign_in_as(user)
    visit trek_path(trek)
    click_link "Add Trail Report"
    fill_in "Start Date", with: "05-12-2015"
    fill_in "Start Time", with: "08:00"
    fill_in "End Date", with: "16:00"
    fill_in "End Time", with: "16:00"
    fill_in "Duration", with: "08:00"
    fill_in "Distance", with: "32"
    check "Public"
    fill_in "Report", with: "Oh my poor quads!"
    click_button "Add Trail Report"

    expect(current_path).to eq trek_path(trek)
    expect(page).to have_content("2015-12-05")
  end

  scenario "invalid information is supplied" do
    sign_in_as(user)
    visit trek_path(trek)
    click_link "Add Trail Report"
    fill_in "Duration", with: "Yah"
    click_button "Add Trail Report"

    expect(page).to have_content("can't be blank")
    expect(page).to have_content("Duration only hh:mm")
  end

  scenario "public reports can be seen by anyone" do
    sign_in_as(user)
    visit trek_path(trek)
    click_link "Add Trail Report"
    fill_in "Start Date", with: "2015-05-12"
    fill_in "Report", with: "Oh my poor quads!"
    check "Make Public?"
    click_button "Add Trail Report"
    click_link "Sign Out"
    visit trek_path(trek)

    expect(page).to have_content user.username
    expect(page).to have_content "2015-05-12"
  end

  scenario "private reports can't be seen by other users" do
    # sign_in_as(user)
    # visit trek_path(trek)
    # expect(page).to have_content report.starts_at.strftime("%Y-%m-%e")
    #
    # click_link "Sign Out"
    # sign_in_as(user2)
    # visit trek_path(trek)

    # expect(page).to_not have_content user.username
    # expect(page).to_not have_content report.starts_at.strftime("%Y-%m-%e")
  end
end
