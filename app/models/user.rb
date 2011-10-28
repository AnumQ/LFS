class User < ActiveRecord::Base
  attr_accessor :updating_password
  
  attr_accessible :AIMS_no, :name, :jamaat_id, :email, :address_line1, :address_line2, :postcode, :city, :country, :contact_no, :password, :password_confirmation
  
  validates_presence_of :AIMS_no, :name, :email, :on => :create
  
  validates :AIMS_no, :uniqueness => true,
                      :length => {:minimum => 5, :maximum => 10}  

  has_secure_password
  validates_presence_of :password, :if => :should_validate_password?
  validates :password, :presence, :length => {:minimum => 6, :maximum => 40}, :confirmation => true, :if => :should_validate_password?                       
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => {:with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  def should_validate_password?
    updating_password || new_record?
  end

  
  belongs_to :jamaat
  
end
