class CreatePaidUsers < ActiveRecord::Migration
  def change
    create_table :paid_users do |t|
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key(:paid_users, :users,dependent: :delete)
  end
end
