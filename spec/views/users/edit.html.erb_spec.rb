require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :AIMS_no => 1,
      :email => "MyString",
      :address => "MyString",
      :contact_no => 1
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_AIMS_no", :name => "user[AIMS_no]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_address", :name => "user[address]"
      assert_select "input#user_contact_no", :name => "user[contact_no]"
    end
  end
end
