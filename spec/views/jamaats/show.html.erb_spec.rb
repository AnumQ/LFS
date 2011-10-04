require 'spec_helper'

describe "jamaats/show.html.erb" do
  before(:each) do
    @jamaat = assign(:jamaat, stub_model(Jamaat,
      :name => "Name",
      :size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
