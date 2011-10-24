class User < ActiveRecord::Base
  attr_accessible :AIMS_no, :name, :jamaat_id, :email, :address_line1, :address_line2, :postcode, :city, :country, :contact_no, :password, :password_confirmation
  has_secure_password
  validates_presence_of :AIMS_no, :name, :password, :email, :on => :create
  
  validates :AIMS_no, :uniqueness => true,
                      :length => {:minimum => 5, :maximum => 10}  

  validates :password, :confirmation => true, 
                       :length => {:minimum => 6, :maximum => 40}                      
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => {:with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  

  
  belongs_to :jamaat
  
end
