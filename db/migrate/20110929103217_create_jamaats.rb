class CreateJamaats < ActiveRecord::Migration
  def change
    create_table :jamaats do |t|
      t.string :jamaat_name
      t.integer :size

      t.timestamps
    end
  end
end
