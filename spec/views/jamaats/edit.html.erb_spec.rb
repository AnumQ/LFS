require 'spec_helper'

describe "jamaats/edit.html.erb" do
  before(:each) do
    @jamaat = assign(:jamaat, stub_model(Jamaat,
      :jamaat_name => "MyString",
      :size => 1
    ))
  end

  it "renders the edit jamaat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jamaats_path(@jamaat), :method => "post" do
      assert_select "input#jamaat_jamaat_name", :jamaat_name => "jamaat[jamaat_name]"
      assert_select "input#jamaat_size", :size => "jamaat[size]"
    end
  end
end
