require 'spec_helper'

describe User do

  before(:each) do
    @attr =  {
       :AIMS_no => "44148",       
       :name => "Anum Qudsia",
       :jamaat_id => 1,
       :password_digest => "lfs44148",
       :password => "lfs44148",
       :password_confirmation => "lfs44148",
       :email => "anumqudsia@hotmail.com",
       :address_line1 => "19 Dunsfold House",
       :address_line2 => "Kingstnympton Park",
       :postcode => "KT2 7RT",
       :city => "Kingston Upon Thames",
       :country => "UK",
       :contact_no => "07907819458"
    }

  end
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a AIMS id" do
    no_AIMS_user = User.new(@attr.merge(:AIMS_no => ""))
    no_AIMS_user.should_not be_valid
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject AIMS ids that are too long" do
    long_AIMS = "a" * 345098
    long_AIMS_user = @attr.merge(:AIMS_no => long_AIMS)
    User.new(long_AIMS_user).should_not be_valid
  end 
  
  describe "email validations" do
    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
   end
   
   it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
   end
   
   describe "duplications" do
     it "should reject duplicate AIMS numbers" do 
       User.create(@attr)
       user_with_duplicate_AIMS = User.new(@attr)
       user_with_duplicate_AIMS.should_not be_valid
     end
     
     it "should reject email addresses identical up to case" do
       upcased_email = @attr[:email].upcase
       User.create!(@attr.merge(:email => upcased_email))
       user_with_duplicate_email = User.new(@attr)
       user_with_duplicate_email.should_not be_valid
     end
   end
   
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end 
  end
end