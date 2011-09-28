class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :aims_id
      t.string :email
      t.string :address
      t.integer :contact_no

      t.timestamps
    end
  end
end
