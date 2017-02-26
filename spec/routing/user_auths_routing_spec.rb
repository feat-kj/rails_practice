require "rails_helper"

RSpec.describe UserAuthsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_auths").to route_to("user_auths#index")
    end

    it "routes to #new" do
      expect(:get => "/user_auths/new").to route_to("user_auths#new")
    end

    it "routes to #show" do
      expect(:get => "/user_auths/1").to route_to("user_auths#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_auths/1/edit").to route_to("user_auths#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_auths").to route_to("user_auths#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_auths/1").to route_to("user_auths#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_auths/1").to route_to("user_auths#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_auths/1").to route_to("user_auths#destroy", :id => "1")
    end

  end
end
