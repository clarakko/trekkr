require "rails_helper"

feature "new user signs up", %{
  As a prospective user
  I want to sign up
  So that I can enroll in challenges

  Acceptance Criteria
  [ ] I will create an account from the sign up page
  [ ] I must specify a valid username
  [ ] I must specify a valid e-mail
  [ ] I must specify a password and confirm that password
  [ ] I get error messages if I do not perform the above
  [ ] I register my account and am authenticated if I specify valid information
} do

  scenario "prospective user gets to sign up page from root path" do
    visit root_path
    click_on "Join Us"
    expect(page).to have_content("Password confirmation")
  end

  scenario "prospective user correctly submits sign up form" do
    visit new_user_registration_path
    fill_in "Username", with: "Johnny"
    fill_in "Email", with: "johnny@appleseed.com"
    fill_in "Password", with: "johnnygold"
    fill_in "Password confirmation", with: "johnnygold"
    click_button "Sign Up"
    expect(page).to have_content("Welcome to Trekkr! Let's get hiking!")
  end

  scenario "required information is not supplied" do
    visit new_user_registration_path
    click_button "Sign Up"
    expect(page).to have_content("can't be blank")
  end

  scenario "password does not match confirmation" do
    visit new_user_registration_path
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "moredifferentpassword"
    click_button "Sign Up"
    expect(page).to have_content("doesn't match")
  end
end
