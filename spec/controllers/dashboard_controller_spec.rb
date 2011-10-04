require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the title Dashboard" do
      get 'index'
      response.should have_selector("title", :content => "Dashboard")
    end
  end 

end
