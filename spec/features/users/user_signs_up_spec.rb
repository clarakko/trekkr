require "rails_helper"

feature "new user signs up", %{
  As a prospective user
  I want to sign up
  So that I can enroll in challenges

  Acceptance Criteria
  [X] I will create an account from the sign up page
  [X] I must specify a valid username
  [X] I must specify a valid e-mail
  [X] I must specify a password and confirm that password
  [X] I get error messages if I do not perform the above
  [X] I register my account and am authenticated if I specify valid information
} do

  scenario "prospective user gets to sign up page from root path" do
    visit root_path
    click_on "Join Us"
    expect(page).to have_content("Password confirmation")
  end

  scenario "prospective user correctly submits sign up form" do
    visit new_user_registration_path
    fill_in "Username", with: "snusmumriken"
    fill_in "Email", with: "snusmuriken@mumintroll.com"
    fill_in "Password", with: "jagarenensling"
    fill_in "Password confirmation", with: "jagarenensling"
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
