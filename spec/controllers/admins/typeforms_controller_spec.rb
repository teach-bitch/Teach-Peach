require 'rails_helper'

RSpec.describe Admins::TypeformsController, type: :controller do

  let(:valid_attributes) {
    {user_id: User.all.sample.id,
    for_adult: true,
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
      Typeform.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      typeform = Typeform.create! valid_attributes
      get :show, params: {id: typeform.to_param}, session: valid_session
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
      typeform = Typeform.create! valid_attributes
      get :edit, params: {id: typeform.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Typeform" do
        expect {
          post :create, params: {typeform: valid_attributes}, session: valid_session
        }.to change(Typeform, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {typeform: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {user_id: User.all.sample.id,
        for_adult: false,
        title: 'Typeform pour ado',
        description: 'Un super questionnaire de bg pour ado',
        id_typeform: 234567,
        id_results: 765432}
      }

      it "updates the requested typeform" do
        typeform = Typeform.create! valid_attributes
        put :update, params: {id: typeform.to_param, typeform: new_attributes}, session: valid_session
        typeform.reload
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested typeform" do
      typeform = Typeform.create! valid_attributes
      expect {
        delete :destroy, params: {id: typeform.to_param}, session: valid_session
      }.to change(Typeform, :count).by(-1)
    end

    it "redirects to the admin typeforms list" do
      typeform = Typeform.create! valid_attributes
      delete :destroy, params: {id: typeform.to_param}, session: valid_session
      expect(response).to redirect_to(admins_typeforms_path)
    end
  end

end
