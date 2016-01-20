require "rails_helper"

feature "users views single challenge", %{
  As an unauthenticated user
  I can view an individual trek
  So that I can understand the nature of the trek

  Acceptance Criteria:
  - [ ] I can select a trek from the trek index page
  - [ ] I can select a trek from the challenge show trek index
  - [ ] I can see a title, location, and description of the trek
  - [ ] I can see which challenges are associated with the trek
} do
  let!(:trek) { FactoryGirl.create(:trek) }
  let!(:challenge) { FactoryGirl.create(:challenge) }
  let!(:step) { FactoryGirl.create(:step, challenge: challenge, trek: trek)}

  scenario "unauthenticated user sees individual trek from index" do
    visit root_path
    click_link 'Treks'
    click_link trek.title
    expect(page).to have_content(trek.title)
    expect(page).to have_content(trek.location)
    expect(page).to have_content(trek.description)
  end

  scenario "unauthenticated user sees individual trek from challenge show" do
    visit root_path
    click_link 'Challenges'
    click_link challenge.title
    expect(page).to have_content(challenge.description)
    expect(page).to have_content(trek.title)
    expect(page).to_not have_content(trek.description)

    click_link trek.title
    expect(page).to have_content(trek.description)
  end

  scenario "user sees associated challenges from trek show page" do
    visit root_path
    click_link 'Treks'
    click_link trek.title
    expect(page).to have_content(challenge.title)
  end
end
