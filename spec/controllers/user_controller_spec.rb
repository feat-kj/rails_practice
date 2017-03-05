require 'rails_helper'
require 'spec_helper'

RSpec.describe UserController, type: :controller do

  describe "画面制御(認証あり)" do

    before do
      @user = create(:user)
      @user_auth = @user.user_auth
      login_user(@user_auth)
    end

    it "returns http success" do
      get :show
      expect(assigns(:user)).to eq @user
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "画面制御(認証なし)" do
    before do
      logout_user
    end

    it "認証なし (show)" do
      get :show
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end

    it "認証なし (edit)" do
      get :edit
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end

    it "認証なし (update)" do
      post :update
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe "データ作成" do
    before do
      logout_user
      @genre_ids = [1,2]
    end

    it "新規ユーザーの作成が成功すること" do
      user_attributes      = attributes_for(:user)
      user_auth_attributes = attributes_for(:user_auth)

      expect {
        post :create, params: {user: user_attributes, user_auth: user_auth_attributes, genre_ids: @genre_ids}
      }.to change(UserAuth, :count).by(1)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_show_path)
    end
    it "validationエラー時に入力画面に戻ること" do
      user_attributes      = attributes_for(:user,:blank_profile)
      user_auth_attributes = attributes_for(:user_auth)

      expect {
        post :create, params: {user: user_attributes, user_auth: user_auth_attributes, genre_ids: @genre_ids}
      }.to change(UserAuth, :count).by(0)

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "データ更新" do
    before do
      @user = create(:user)
      @user_auth = @user.user_auth
      login_user(@user_auth)
      @genre_ids = [1,4,5]
    end

    it "更新が正常に行われる事" do
      user_attributes      = attributes_for(:user, :update_name)
      user_auth_attributes = attributes_for(:user_auth)

      post :update, params: {user: user_attributes, user_auth: user_auth_attributes, genre_ids: @genre_ids}
      update_user = User.find(@user.id)

      expect(update_user.name).to eq(user_attributes[:name])
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_show_path)

    end
    it "validationエラー時に入力画面に戻ること" do
      user_attributes      = attributes_for(:user, :blank_profile)
      user_auth_attributes = attributes_for(:user_auth)

      post :update, params: {user: user_attributes, user_auth: user_auth_attributes, genre_ids: @genre_ids}
      update_user = User.find(@user.id)

      expect(update_user.profile).to be_present
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)

    end
  end
end
