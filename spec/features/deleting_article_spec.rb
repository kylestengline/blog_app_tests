require "rails_helper"

RSpec.feature "Deleting an Article" do

  let!(:user) {User.create(email: "john@example.com", password: "password")}

  let!(:article) {Article.create(title: "First Article", body: "Body of first article", user: user)}

  scenario "A user deletes an article" do

    login_as(user)
    
    visit "/"

    click_link article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end
