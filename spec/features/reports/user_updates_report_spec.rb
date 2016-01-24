require 'rails_helper'

feature "user updates own trail report: ", %{
  As an authenticated user
  I want to edit an existing report I created
  So that I can make my reports more correct

  Acceptance Criteria
  [x] I am authenticated and I can access an update page to edit my
      bourbon.
  [x] I see errors if update form invalid
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:trek) { FactoryGirl.create(:trek) }
  let!(:report) { FactoryGirl.create(:full_report, user: user, trek: trek) }
  let!(:malcontent) { FactoryGirl.create(:user) }

  scenario "creator can see update page link" do
    sign_in_as(user)
    visit trek_path(trek)
    click_link report.starts_at.strftime("%Y-%m-%e")
    expect(page).to have_link "Update"

    click_link "Update"
    expect(page).to have_content "Update Trail Report"
  end

  scenario "unauthorized user cannot see update report link" do
    visit report_path(report)
    expect(page).to_not have_link "Update"

    sign_in_as(malcontent)
    visit report_path(report)
    expect(page).to_not have_link "Update"
  end

  scenario "creator validly edits the report" do
    sign_in_as(user)
    visit edit_report_path(report)

    expect(find_field("Weather").value).to eq report.weather

    fill_in "Start Date", with: report.starts_at.strftime("%Y-%m-%e")
    fill_in "Weather", with: "Cool island breezes!"
    click_button "Update Trail Report"

    expect(page).to have_content "Trail report updated successfully"
  end

  scenario "creator invalidly edits report" do
    sign_in_as(user)
    visit edit_report_path(report)

    fill_in "Report", with: ""
    fill_in "Start Date", with: ""
    click_button "Update Trail Report"

    expect(page).to have_content "can't be blank"
  end
end
