require "rails_helper"

RSpec.describe BorrowersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/borrowers").to route_to("borrowers#create")
    end
  end
end
