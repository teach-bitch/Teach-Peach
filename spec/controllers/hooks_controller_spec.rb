require 'rails_helper'

RSpec.describe HooksController, type: :controller do

  describe "GET #stripe" do
    it "returns http success" do
      get :stripe
      expect(response).to have_http_status(:success)
    end
  end

end
