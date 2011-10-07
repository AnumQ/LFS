class User < ActiveRecord::Base
  attr_accessible :AIMS_no, :password, :password_confirmation
  has_secure_password
  validates_presence_of :AIMS_no, :name, :password, :email, :contact_no, :on => :create
  validates_presence_of :AIMS_no, :on => :create

  belongs_to :jamaat
  validates :AIMS_no, :length => {:minimum => 5, :maximum => 20}

  
end
