class UserMailer < ActionMailer::Base
  default :from => "prashanth702@gmail.com"
 
  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.firstname} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "Welcome to gotoCollegeinUS - Activation")
  end
end
