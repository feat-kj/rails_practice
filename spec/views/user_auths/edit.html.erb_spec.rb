require 'rails_helper'

RSpec.describe "user_auths/edit", type: :view do
  before(:each) do
    @user_auth = assign(:user_auth, UserAuth.create!(
      :email => "MyString",
      :crypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the edit user_auth form" do
    render

    assert_select "form[action=?][method=?]", user_auth_path(@user_auth), "post" do

      assert_select "input#user_auth_email[name=?]", "user_auth[email]"

      assert_select "input#user_auth_crypted_password[name=?]", "user_auth[crypted_password]"

      assert_select "input#user_auth_salt[name=?]", "user_auth[salt]"
    end
  end
end
