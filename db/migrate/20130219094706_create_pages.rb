class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :status
      t.string :key
      t.integer :ptype

      t.timestamps
    end
  end
end
