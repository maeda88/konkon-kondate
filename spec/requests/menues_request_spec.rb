require 'rails_helper'

RSpec.describe "Menues", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/menues/index"
      expect(response).to have_http_status(:success)
    end
  end

end
