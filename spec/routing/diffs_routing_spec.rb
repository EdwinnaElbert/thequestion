require "rails_helper"

RSpec.describe DiffsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/diffs").to route_to("diffs#index")
    end

    it "routes to #new" do
      expect(:get => "/diffs/new").to route_to("diffs#new")
    end

    it "routes to #show" do
      expect(:get => "/diffs/1").to route_to("diffs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/diffs/1/edit").to route_to("diffs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/diffs").to route_to("diffs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/diffs/1").to route_to("diffs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/diffs/1").to route_to("diffs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/diffs/1").to route_to("diffs#destroy", :id => "1")
    end
  end
end
