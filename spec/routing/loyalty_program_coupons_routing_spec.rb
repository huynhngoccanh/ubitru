require "rails_helper"

RSpec.describe LoyaltyProgramCouponsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/loyalty_program_coupons").to route_to("loyalty_program_coupons#index")
    end

    it "routes to #new" do
      expect(:get => "/loyalty_program_coupons/new").to route_to("loyalty_program_coupons#new")
    end

    it "routes to #show" do
      expect(:get => "/loyalty_program_coupons/1").to route_to("loyalty_program_coupons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/loyalty_program_coupons/1/edit").to route_to("loyalty_program_coupons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/loyalty_program_coupons").to route_to("loyalty_program_coupons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/loyalty_program_coupons/1").to route_to("loyalty_program_coupons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/loyalty_program_coupons/1").to route_to("loyalty_program_coupons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/loyalty_program_coupons/1").to route_to("loyalty_program_coupons#destroy", :id => "1")
    end

  end
end
