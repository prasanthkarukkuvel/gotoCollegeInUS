class ChangeColumnNotnullPageInfo < ActiveRecord::Migration
  def up
  	change_column :page_infos, :page_id, :integer, :null => false
  end

  def down
  end
end
