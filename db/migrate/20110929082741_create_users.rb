class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :AIMS_no
      t.string :email
      t.string :address
      t.integer :contact_no

      t.timestamps
    end
  end
end
