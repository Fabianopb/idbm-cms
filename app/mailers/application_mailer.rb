class ApplicationMailer < ActionMailer::Base
	default from: 'idbm321@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://safe-earth-52111.herokuapp.com/'
    delivery_options = {
		  :address              => "smtp.gmail.com",
		  :port                 => 587,
		  :domain               => 'gmail.com',
		  :user_name            => 'idbm321@gmail.com',
		  :password             => 'idbm2014',
		  :authentication       => 'plain',
		  :enable_starttls_auto => true  
		}
    mail(to: @user.email, subject: 'Welcome to IDBM Industry Project!', delivery_method_options: delivery_options)
  end

  def reset_email(user)
  	@user = user
  	delivery_options = {
		  :address              => "smtp.gmail.com",
		  :port                 => 587,
		  :domain               => 'gmail.com',
		  :user_name            => 'idbm321@gmail.com',
		  :password             => 'idbm2014',
		  :authentication       => 'plain',
		  :enable_starttls_auto => true  
		}
    mail(to: @user.email, subject: 'IDBM Password reset instructions', delivery_method_options: delivery_options)
  end

end