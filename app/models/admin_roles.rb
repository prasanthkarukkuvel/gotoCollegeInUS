class AdminRoles < ActiveRecord::Base
  attr_accessible :id,:handle_page_requests,:handle_users,:handle_pages,:handle_professors,:handle_Reports,:can_delete,:can_edit,:is_active,:show_all_details,:send_emails,:admin_user_id
  belongs_to :admin_user
  validates_uniqueness_of :admin_user_id,message:"Roles have already assigned for this Admin User"
end
