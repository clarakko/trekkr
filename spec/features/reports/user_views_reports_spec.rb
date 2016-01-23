require "rails_helper"

feature "user views trail reports", %{
  As a user
  I can view a trek's trail reports
  So that I can see what treks are like.

  Acceptance Criteria:
  - [X] I can see my private reports on trek show page if I am authenticated
  - [X] I can see all public reports on trek show page
  - [X] I can see an index list of my trail reports
  - [X] I can view an individual report
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:trek) { FactoryGirl.create(:trek) }

  scenario "private reports can't be seen by other users" do
    report = FactoryGirl.create(:report, user: user, trek: trek)
    sign_in_as(user)
    visit trek_path(trek)
    expect(page).to have_content user.username
    expect(page).to have_content report.starts_at.strftime("%Y-%m-%e")

    click_link 'Sign Out'
    sign_in_as(user2)
    visit trek_path(trek)
    expect(page).to_not have_content user.username
    expect(page).to_not have_content report.starts_at.strftime("%Y-%m-%e")
  end

  scenario "public reports can be seen by anyone" do
    pr = FactoryGirl.create(:public_report, user: user, trek: trek)
    visit trek_path(trek)

    expect(page).to have_content user.username
    expect(page).to have_content pr.starts_at.strftime("%Y-%m-%e")
  end

  scenario "authenticated user access index of personal trail reports" do
    private_report = FactoryGirl.create(:report, user: user, trek: trek)
    visit root_path
    expect(page).to_not have_link 'My Trail Reports'

    sign_in_as(user)
    click_link 'My Trail Reports'

    expect(page).to have_content(private_report.starts_at.strftime("%Y-%m-%e"))
  end

  scenario "user accesses individual trail report" do
    report = FactoryGirl.create(:full_report, user: user, trek: trek)
    visit trek_path(trek)
    click_link report.starts_at.strftime("%Y-%m-%e")

    expect(page).to have_content '10:00 AM'
    expect(page).to have_content '02:00'
    expect(page).to have_content 'Sunny and balmy'
    expect(page).to have_content 'Trail was perfect'
    expect(page).to have_content '6'
    expect(page).to have_content 'Could not have been a better hike!'
  end
end
