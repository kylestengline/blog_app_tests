require 'rails_helper'

RSpec.feature "Showing an Article" do 

# Must create two users so we can later log_in as one to create a scenario where non-owners of articles will not see edit or delete. 
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: "The first article", body: "Body of first article", user: @john)
  end

  scenario "A non-signed in user does not see edit or delete links" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")

  end

# logging in as another user or non-owner of article, they will not be able to see edit or delete actions.  Manipulated the show html to get this to pass.
  scenario "A non-owner signed in cannot see both links" do
    
    login_as(@fred)

    visit "/"

    click_link @article.title

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")

  end

  scenario "A signed in owner sees both links" do
    login_as(@john)

    visit "/"

    click_link @article.title

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
  # basically saying, "Ok, here's the scenario I want for the page" Then you write that code and manipulate the files you need to in order to pass the test.
  scenario "Display individual article" do
    visit "/"

    # click link by title to show individual article. Shown on index page.
    click_link @article.title

    # expect index page to show the title of individual article as well as the body. 
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    # expects a link on the index page to have a path to show individual articles.
    expect(current_path).to eq(article_path(@article))
  end
end