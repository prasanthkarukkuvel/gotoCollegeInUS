class ChangeColumnNotnullPageAdmin < ActiveRecord::Migration
  def up
  	change_column :page_admins, :page_id, :integer, :null => false
  end

  def down
  end
end
