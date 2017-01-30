require "rails_helper"

RSpec.feature "Signing out signed-in users" do 
  
  let(:user) {User.create!(email: "john@example.com", password: "password")}

  before do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
