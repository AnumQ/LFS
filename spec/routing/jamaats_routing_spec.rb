require "spec_helper"

describe JamaatsController do
  describe "routing" do

    it "routes to #index" do
      get("/jamaats").should route_to("jamaats#index")
    end

    it "routes to #new" do
      get("/jamaats/new").should route_to("jamaats#new")
    end

    it "routes to #show" do
      get("/jamaats/1").should route_to("jamaats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jamaats/1/edit").should route_to("jamaats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jamaats").should route_to("jamaats#create")
    end

    it "routes to #update" do
      put("/jamaats/1").should route_to("jamaats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jamaats/1").should route_to("jamaats#destroy", :id => "1")
    end

  end
end
