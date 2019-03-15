require "rails_helper"

RSpec.describe TypeformsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/typeforms").to route_to("typeforms#index")
    end

    it "routes to #new" do
      expect(:get => "/typeforms/new").to route_to("typeforms#new")
    end

    it "routes to #show" do
      expect(:get => "/typeforms/1").to route_to("typeforms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/typeforms/1/edit").to route_to("typeforms#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/typeforms").to route_to("typeforms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/typeforms/1").to route_to("typeforms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/typeforms/1").to route_to("typeforms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/typeforms/1").to route_to("typeforms#destroy", :id => "1")
    end
  end
end
