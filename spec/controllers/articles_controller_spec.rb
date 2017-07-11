require 'rails_helper'
require 'support/macros'

# only the owner of the article can edit and update it. We do this to prevent non-owners from gaining access to the edit path. Check out macros.rb file first.
RSpec.describe ArticlesController, :type => :controller do

  describe "GET edit" do

    #before anything else, a user is created.
    let(:user) {User.create(email: "john@example.com", password: "password")}

    # only the owner can edit his article
    context "owner is allowed to edit his articles" do
      it "renders the edit template" do
        login_user user
        article = Article.create(title: "First article", body: "Body of first article", user: user)

        get :edit, params: { id: article }
        expect(response).to render_template :edit
      end
    end

    # logged in user is fred, but the article creator is john. restricts access from fred so he cannot edit articles john created.
    context "non-owner is not allowed to edit other users articles" do
      it "redirects to the root path" do
        fred = User.create(email: "fred@example.com", password: "password")

        login_user fred

        article = Article.create(title: "First article", body: "Body of first article", user: user)

        get :edit, params: { id: article }
        expect(response).to redirect_to(root_path)
        message = "You can only edit your own article."
        expect(flash[:danger]).to eq message
      end
    end
    

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
