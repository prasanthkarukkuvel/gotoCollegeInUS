class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :firstname
      t.string :lastname
      t.string :contact
      t.string :email,null: false
      t.string :username,null: false
      t.string :password,null: false
      t.string :department
      t.string :designation
      t.integer :isactive
      t.string :key,null: false
      t.string :slug

      t.timestamps
    end
  end
end
