class CreateUsernames < ActiveRecord::Migration
  def change
    create_table :usernames do |t|
      t.string :name,null:false
      t.string :ntype,null:false

      t.timestamps
    end
  end
end
