require 'spec_helper'

describe "jamaats/new.html.erb" do
  before(:each) do
    assign(:jamaat, stub_model(Jamaat,
      :jamaat_name => "MyString",
      :size => 1
    ).as_new_record)
  end

  it "renders new jamaat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jamaats_path, :method => "post" do
      assert_select "input#jamaat_jamaat_name", :jamaat_name => "jamaat[jamaat_name]"
      assert_select "input#jamaat_size", :size => "jamaat[size]"
    end
  end
end
