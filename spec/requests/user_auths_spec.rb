require 'rails_helper'

RSpec.describe "UserAuths", type: :request do
  describe "GET /user_auths" do
    it "works! (now write some real specs)" do
      get user_auths_path
      expect(response).to have_http_status(200)
    end
  end
end
