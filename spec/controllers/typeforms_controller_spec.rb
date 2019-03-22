require 'rails_helper'

RSpec.describe TypeformsController, type: :controller do

  let(:valid_attributes) {
    {user_id: User.all.sample.id,
    for_adult: false,
    title: 'Typeform',
    description: 'Un super questionnaire de bg',
    id_typeform: 123456,
    id_results: 654321}
  }

  let(:invalid_attributes) {
    {
      title: "Il manque plein de champs à ce typeform"
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
    it "should allow visitor to view the show page" do
      login_with nil
      typeform = Typeform.create! valid_attributes
      get :show, params: {id: typeform.to_param}, session: valid_session
      expect( response ).to render_template( :show )
    end
  end

  describe "user" do
    it "should allow user to view the show page" do
      login_with create( :user )
      typeform = Typeform.create! valid_attributes
      get :show, params: {id: typeform.to_param}, session: valid_session
      expect( response ).to render_template( :show )
    end
  end

  describe "admin" do
    it "should allow admin to view the show page" do
      typeform = Typeform.create! valid_attributes
      get :show, params: {id: typeform.to_param}, session: valid_session
      expect( response ).to render_template( :show )
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      typeform = Typeform.create! valid_attributes
      get :show, params: {id: typeform.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

end
