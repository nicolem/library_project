require "rails_helper"

RSpec.describe ParentBooksController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/libraries/:id/books").to route_to("parent_books#create", "library_id"=>":id")
    end
  end
end
