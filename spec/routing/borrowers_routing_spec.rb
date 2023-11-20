require "rails_helper"

RSpec.describe BorrowersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/libraries/:id/borrowers").to route_to("borrowers#create", "library_id"=>":id")
    end
  end
end
