require "rails_helper"

RSpec.describe FacturationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/facturations").to route_to("facturations#index")
    end

    it "routes to #new" do
      expect(:get => "/facturations/new").to route_to("facturations#new")
    end

    it "routes to #show" do
      expect(:get => "/facturations/1").to route_to("facturations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/facturations/1/edit").to route_to("facturations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/facturations").to route_to("facturations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/facturations/1").to route_to("facturations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/facturations/1").to route_to("facturations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/facturations/1").to route_to("facturations#destroy", :id => "1")
    end
  end
end
