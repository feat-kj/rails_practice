require 'rails_helper'

RSpec.describe UserController, type: :controller do

  # http://qiita.com/geshi/items/a930461f36bae880657d
  # 正常に動作しているか (http status)
  # 正常にHTTPメソッドを呼び出せているか (render template)
  # インスタンス変数が適切かどうか (assings)
  # モデルの増減 (change by)
  # リダイレクト (redire

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
