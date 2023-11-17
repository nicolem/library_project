require "rails_helper"

RSpec.describe LibrariesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/libraries").to route_to("libraries#create")
    end
  end
end
