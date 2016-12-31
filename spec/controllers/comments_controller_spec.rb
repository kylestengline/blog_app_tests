require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, :type => :controller do

  describe "POST #create" do

    let(:user) {User.create(email: "john@example.com", password: "password")}

    context "signed in user" do
      it "can create a comment" do
        login_user user

        article = Article.create(title: "First Article", body: "Body of first article", user: user)

        post :create, comment: { body: "Awesome post"},
        article_id: article.id
        expect(flash[:success]).to eq("Comment has been created")
      end
    end

    context "non-signed in user" do
      it "is redirected to the sign in page" do
        # no logged in user
        login_user nil
        article = Article.create(title: "First Article", body: "Body of first article", user: user)
        post :create, comment: { body: "Awesome post"},
        article_id: article.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
