class AddAimsUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :AIMS_no, :unique => true
  end

  def self.down
    remove_index :users, :AIMS_no
  end
end
