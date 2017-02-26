require 'rails_helper'

RSpec.describe "user_auths/index", type: :view do
  before(:each) do
    assign(:user_auths, [
      UserAuth.create!(
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      ),
      UserAuth.create!(
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      )
    ])
  end

  it "renders a list of user_auths" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
  end
end
