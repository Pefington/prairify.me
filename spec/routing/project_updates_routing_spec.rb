require "rails_helper"

RSpec.describe ProjectUpdatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project_updates").to route_to("project_updates#index")
    end

    it "routes to #new" do
      expect(get: "/project_updates/new").to route_to("project_updates#new")
    end

    it "routes to #show" do
      expect(get: "/project_updates/1").to route_to("project_updates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project_updates/1/edit").to route_to("project_updates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project_updates").to route_to("project_updates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project_updates/1").to route_to("project_updates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project_updates/1").to route_to("project_updates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project_updates/1").to route_to("project_updates#destroy", id: "1")
    end
  end
end
