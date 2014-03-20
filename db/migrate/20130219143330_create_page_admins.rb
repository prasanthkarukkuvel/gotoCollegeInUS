class CreatePageAdmins < ActiveRecord::Migration
  def change
    create_table :page_admins do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.integer :page_id
      t.string :username
      t.string :password

      t.timestamps
    end
    add_foreign_key(:page_admins, :pages,dependent: :delete)
  end
end
