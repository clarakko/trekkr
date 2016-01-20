require "rails_helper"

feature "user signs in", %{
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them

  - [X] I am authenticated if I specify valid (email OR username) and password
  - [X] I stay unauthenticated if I specify invalid email/username or password
  - [X] I cannot sign-in again if I am already signed in
  - [X] I am redirected to my dashboard when I successfully sign-in
} do

  scenario "existing user specifies a valid username and password" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.username
    fill_in "Password", with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Welcome back!')
    expect(page).to have_content("Sign Out")
  end

  scenario "existing user specifies a valid email and password" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Welcome back!')
    expect(page).to have_content("Sign Out")
  end

  scenario "a nonexistent username and password is supplied" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: "anonexistentuser"
    fill_in "Password", with: "doesntmatter"
    click_button "Sign In"
    expect(page).to_not have_content("Welcome back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Invalid login or password")
  end

  scenario "an existing username with wrong password is denied access" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.username
    fill_in "Password", with: "incorrectPassword"
    click_button "Sign In"
    expect(page).to have_content("Invalid login or password")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "an alread authenticated user cannot re-sign in" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Login", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in.")
  end
end
