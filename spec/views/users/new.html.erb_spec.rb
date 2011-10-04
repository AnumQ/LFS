require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :AIMS_no => 1,
      :jamaat_id => 1,
      :email => "MyString",
      :address_line1 => "MyString",
      :address_line2 => "MyString", 
      :postcode => "MyString", 
      :city => "MyString", 
      :country => "MyString",
      :contact_no => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_AIMS_no", :name => "user[AIMS_no]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_address_line1", :name => "user[address_line1]"
      assert_select "input#user_address_line2", :name => "user[address_line2]" 
      assert_select "input#user_postcode", :name => "user[postcode]" 
      assert_select "input#user_city", :name => "user[city]" 
      assert_select "input#user_country", :name => "user[country]"
      assert_select "input#user_contact_no", :name => "user[contact_no]"
    end
  end
end
