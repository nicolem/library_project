require 'rails_helper'

RSpec.describe "Libraries", type: :request do
  describe "POST /libraries" do
    it "creates new library record" do
      post libraries_url, params: { library: { name: Faker::University.name } }, as: :json
      expect(response).to have_http_status(201)
    end
  end
end
