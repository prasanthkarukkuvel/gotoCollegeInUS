class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname,null: false
      t.string :lastname,null: false
      t.string :email,null: false
      t.string :contact,null: false
      t.string :password,null: false
      t.string :dob,null: false
      t.string :gender,null: false
      t.string :slug
      t.string :key,null: false
      t.string :username
      t.boolean :ispaid
      t.boolean :isactive
      t.timestamps
    end
   add_index :users, :slug
   add_index :users, :key
  end
end
