class CreatePageActivates < ActiveRecord::Migration
  def change
    create_table :page_activates do |t|
      t.string :key,null:false
      t.string :note
      t.integer :admin_user_id,null:false
      t.integer :page_id,null:false

      t.timestamps
    end
    add_foreign_key(:page_activates, :admin_users,dependent: :delete)
    add_foreign_key(:page_activates, :pages,dependent: :delete)
  end
end
