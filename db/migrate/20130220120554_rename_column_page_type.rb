class RenameColumnPageType < ActiveRecord::Migration
  def up
  	rename_column :pages, :type, :ptype
  end

  def down
  end
end
