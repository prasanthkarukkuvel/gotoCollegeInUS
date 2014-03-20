class CreatePageInfos < ActiveRecord::Migration
  def change
    create_table :page_infos do |t|
      t.string :title
      t.string :code
      t.string :website
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :fax
      t.integer :page_id
      t.string :desc
      t.string :slug
      t.string :key

      t.timestamps
    end
    add_foreign_key(:page_infos, :pages,dependent: :delete)
  end
end
