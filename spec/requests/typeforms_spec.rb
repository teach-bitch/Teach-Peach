require 'rails_helper'

RSpec.describe "Typeforms", type: :request do
  describe "GET /typeforms" do
    it "works! (now write some real specs)" do
      get typeforms_path
      expect(response).to have_http_status(200)
    end
  end
end
