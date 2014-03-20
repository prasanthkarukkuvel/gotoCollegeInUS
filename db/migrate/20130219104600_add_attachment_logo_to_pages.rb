class AddAttachmentLogoToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :pages, :logo
  end
end
