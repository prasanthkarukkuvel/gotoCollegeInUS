class PageDeleteMailer < ActionMailer::Base
  default :from => "prashanth702@gmail.com"
 
  def page_delete_email(page)
    @page = page
    email_with_name = "#{@page[:name]} <#{@page[:email]}>"
    mail(:to => email_with_name, :subject => "Welcome to gotoCollegeinUS | Page Request Rejected")
  end
end
