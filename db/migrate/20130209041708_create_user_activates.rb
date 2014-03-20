class CreateUserActivates < ActiveRecord::Migration
  def change
    create_table :user_activates do |t|
      t.string :akey,null: false
      t.integer :user_id,null: false
      
      t.timestamps
    end
    add_foreign_key(:user_activates, :users,dependent: :delete)
  end
end
