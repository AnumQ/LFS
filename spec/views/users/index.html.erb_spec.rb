require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :AIMS_no => 1,        
        :jamaat_id => 1,
        :email => "Email",
        :address_line1 => "Address_line1",
        :address_line1 => "Address_line2",
        :postcode => "postcode", 
        :city => "city", 
        :country => "city",
        :contact_no => 1
      ),
      stub_model(User,
        :name => "Name",
        :AIMS_no => 1,
        :jamaat_id => 1,
        :email => "Email",
        :address_line1 => "Address_line1",
        :address_line1 => "Address_line2",
        :postcode => "postcode", 
        :city => "city", 
        :country => "city",
        :contact_no => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 6
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
 
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 6
  end
end
