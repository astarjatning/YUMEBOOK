require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /privacy_policy" do
    it "returns http success" do
      get "/pages/privacy_policy"
      expect(response).to have_http_status(:success)
    end
  end

end
