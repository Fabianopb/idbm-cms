class ApplicationMailer < ActionMailer::Base
	default from: 'fabianopbrito@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/sign_in'
	  delivery_options = {
		  :address              => "smtp.gmail.com",
		  :port                 => 587,
		  :domain               => 'gmail.com',
		  :user_name            => 'fabianopbrito@gmail.com',
		  :password             => 'drila0506',
		  :authentication       => 'plain',
		  :enable_starttls_auto => true  
		}
    mail(to: @user.e_mail, subject: 'Welcome to IDBM Industry Project!', delivery_method_options: delivery_options)
  end
end