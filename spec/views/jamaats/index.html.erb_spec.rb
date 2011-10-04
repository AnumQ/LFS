require 'spec_helper'

describe "jamaats/index.html.erb" do
  before(:each) do
    assign(:jamaats, [
      stub_model(Jamaat,
        :jamaat_name => "Name",
        :size => 1
      ),
      stub_model(Jamaat,
        :jamaat_name => "Name",
        :size => 1
      )
    ])
  end

  it "renders a list of jamaats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
