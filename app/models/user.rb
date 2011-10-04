class User < ActiveRecord::Base
  belongs_to :jamaat
  validates :contact_no, :length => { :minimum => 10, :maximum => 14}
  validates :AIMS_no, :length => {:minimum => 5, :maximum => 20}
end
