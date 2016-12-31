require 'rails_helper'

# feature spec. 
RSpec.feature "Creating Articles" do

  before do
      @john = User.create!(email: "john@example.com", password: "password")
      login_as(@john)
  end

  scenario "A user creates a new article" do
    
    # Testing that we can visit the root path
    visit "/"

    # testing we can click a link called "New Article"
    click_link "New Article"

    #testing that there is a space to fill in a title, body and that we're able to click a button called Create Article.
    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button 'Create article'

    # expecting the page to have content and after article saves displays the message below. Also, expecting the page to have an articles_path
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@john.email}")
  end
  # Another scenario for creating article and make sure the form is not blank.
  scenario "A user fails to create a new article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button 'Create article'

    # expecting pages to display these messages when article is not created. Had to go into the articles_controller to write an if statement and in the views as well as add validations that the article does have content. See validations in the model.
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
