require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

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
    user = FactoryBot.create(:user)
    login_with user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "anonymous user" do
    it "should allow visitor to view the index page" do
      login_with nil
      get :index
      expect( response ).to render_template( :index )
    end
  end

  describe "user" do
    it "should allow user to view the index page" do
      login_with create( :user )
      get :index
      expect( response ).to render_template( :index )
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

end
