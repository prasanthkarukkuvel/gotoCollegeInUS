class CreateAdminRoles < ActiveRecord::Migration
  def change
    create_table :admin_roles do |t|
      t.boolean :handle_page_requests,default:false
      t.boolean :handle_users,default:false
      t.boolean :handle_pages,default:false
      t.boolean :handle_professors,default:false
      t.boolean :handle_Reports,default:false
      t.boolean :can_delete,default:false
      t.boolean :can_edit,default:false
      t.boolean :is_active,default:false
      t.boolean :show_all_details,default:false
      t.boolean :send_emails,default:false
      t.integer :admin_user_id

      t.timestamps
    end
    add_foreign_key(:admin_roles, :admin_users,dependent: :delete)
  end
end
