class Jamaat < ActiveRecord::Base
  attr_accessible :jamaat_name, :size
  
  validates_presence_of :jamaat_name, :size
  
  validates_length_of :size, :maximum => 3
  
  has_many :users
end
