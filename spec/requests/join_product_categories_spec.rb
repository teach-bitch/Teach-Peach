require 'rails_helper'

RSpec.describe "JoinProductCategories", type: :request do
  describe "GET /join_product_categories" do
    it "works! (now write some real specs)" do
      get join_product_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
