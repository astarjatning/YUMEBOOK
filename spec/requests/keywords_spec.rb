require 'rails_helper'

RSpec.describe "Keywords", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/keywords/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/keywords/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/keywords/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
