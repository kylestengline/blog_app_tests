require 'rails_helper'

RSpec.feature "Listing Articles" do 
  
  before do 
    john = User.create(email: "john@example.com", password: "password")
    
    @article1 = Article.create(title: "The first article", body: "Body of first article", user: john)
    @article2 = Article.create(title: "The second article", body: "Body of the second article", user: john)
  end

  # basically saying, "Ok, here's the scenario I want for the page" Then you write that code and manipulate the files you need to in order to pass the test.
  scenario "List all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).not_to have_link("New Article")
  end
end