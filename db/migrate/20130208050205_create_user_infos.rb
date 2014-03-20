class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.string :pincode
      t.string :college
      t.integer :yearofpassing
      t.decimal :gre
      t.decimal :toefl
      t.decimal :transit
      t.integer :user_id,null: false
      t.timestamps
    end
    add_foreign_key(:user_infos, :users,dependent: :delete)
  end
end
