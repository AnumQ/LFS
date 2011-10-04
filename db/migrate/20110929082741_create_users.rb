class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :AIMS_no
      t.integer :jamaat_id
      t.string :email
      t.string :address_line1
      t.string :address_line2
      t.string :postcode
      t.string :city
      t.string :country
      t.string :contact_no

      t.timestamps
    end
  end
end
