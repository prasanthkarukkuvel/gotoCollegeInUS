class PageConfrimMailer < ActionMailer::Base
  default :from => "prashanth702@gmail.com"
 
  def page_confrim_email(page)
    @page = page
    email_with_name = "#{@page[:name]} <#{@page[:email]}>"
    mail(:to => email_with_name, :subject => "Welcome to gotoCollegeinUS | Page Request Confirmation")
  end
end
