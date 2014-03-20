ActiveAdmin.register AdminRoles do

  

  form do |f|                         
    f.inputs "Admin Users" do       
   
      f.input :admin_user, :as => :select, :collection => AdminUser.all.reject! {|x| x.id == 1 }, :member_label => lambda { |i| i.id }
  	  f.input :handle_page_requests
      f.input :handle_users
      f.input :handle_pages
      f.input :handle_professors
      f.input :handle_Reports
      f.input :can_delete
      f.input :can_edit
      f.input :is_active
      f.input :show_all_details
      f.input :send_emails
    end                               
    f.actions                         
  end    
end
