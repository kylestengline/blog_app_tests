require 'rails_helper'

RSpec.feature "Showing an Article" do 

  before do
    @article = Article.create(title: "The first article", body: "Body of first article")
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