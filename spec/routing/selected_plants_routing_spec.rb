require "rails_helper"

RSpec.describe SelectedPlantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/selected_plants").to route_to("selected_plants#index")
    end

    it "routes to #new" do
      expect(get: "/selected_plants/new").to route_to("selected_plants#new")
    end

    it "routes to #show" do
      expect(get: "/selected_plants/1").to route_to("selected_plants#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/selected_plants/1/edit").to route_to("selected_plants#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/selected_plants").to route_to("selected_plants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/selected_plants/1").to route_to("selected_plants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/selected_plants/1").to route_to("selected_plants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/selected_plants/1").to route_to("selected_plants#destroy", id: "1")
    end
  end
end
