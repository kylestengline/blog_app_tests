require "rails_helper"

RSpec.feature "Users sign-in" do 

  let!(:user) {User.create!(email: "john@example.com", password: "password")}

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{user.email}")
  end
end
