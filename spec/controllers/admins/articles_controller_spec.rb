require 'rails_helper'

RSpec.describe Admins::ArticlesController, type: :controller do

  let(:valid_attributes) {
    {user_id: 1,
    title: 'Sulfureux',
    content: 'Le tout nouveau thème sulfurous fait des ravages',
    for_adult: true}
  }

  let(:invalid_attributes) {
    {
      title: "Cette article n'a pas de contenu"
    }
  }

  before(:each) do
    admin = FactoryBot.create(:user)
    admin.admin!
    login_with admin
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "anonymous user" do
    it "should redirect visitor to root page" do
      login_with nil
      get :index
      expect( response ).to redirect_to( root_path )
    end
  end

  describe "user" do
    it "should redirect user to root page" do
      login_with create( :user )
      get :index
      expect( response ).to redirect_to( root_path )
    end
  end

  describe "admin" do
    it "should allow admin to view the index page" do
      get :index
      expect( response ).to render_template( :index )
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      Article.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      article = Article.create! valid_attributes
      get :show, params: {id: article.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      article = Article.create! valid_attributes
      get :edit, params: {id: article.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {article: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {user_id: 1,
        title: 'Sulfurous',
        content: 'Le tout nouveau thème sulfurous fait un tabac',
        for_adult: false}
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: new_attributes}, session: valid_session
        article.reload
      end

      it "redirects to the article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}, session: valid_session
        expect(response).to redirect_to('/admins/articles/' + article.id.to_s)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, params: {id: article.to_param}, session: valid_session
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the admin articles list" do
      article = Article.create! valid_attributes
      delete :destroy, params: {id: article.to_param}, session: valid_session
      expect(response).to redirect_to(admins_articles_path)
    end
  end

end
