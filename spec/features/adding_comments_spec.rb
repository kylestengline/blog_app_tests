require 'rails_helper'

RSpec.feature "Adding reviews to Articles" do 

  let(:user1) {User.create(email: "john@example.com", password: "password")}
  let(:user2) {User.create(email: "fred@example.com", password: "password")}

  let!(:article) {Article.create(title: "First article", body: "Body of first article", user: user1)}

  scenario "permits a signed in user to write a review" do

    login_as(user2)

    visit "/"

    click_link article.title
    fill_in "New Comment", with: "An awesome article"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("An awesome article")
    # must implement a nested route in order for this to work.
    expect(current_path).to eq(article_path(article.comments.last.id))
  end

end
