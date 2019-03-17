require "rails_helper"

RSpec.describe JoinProductCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/join_product_categories").to route_to("join_product_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/join_product_categories/new").to route_to("join_product_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/join_product_categories/1").to route_to("join_product_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/join_product_categories/1/edit").to route_to("join_product_categories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/join_product_categories").to route_to("join_product_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/join_product_categories/1").to route_to("join_product_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/join_product_categories/1").to route_to("join_product_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/join_product_categories/1").to route_to("join_product_categories#destroy", :id => "1")
    end
  end
end
