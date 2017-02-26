require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #confirm" do
    it "returns http success" do
      get :confirm
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #complete" do
    it "returns http success" do
      get :complete
      expect(response).to have_http_status(:success)
    end
  end

end
