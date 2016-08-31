class ApplicationMailer < ActionMailer::Base
	default from: 'idbm321@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://safe-earth-52111.herokuapp.com/'
    delivery_options = {
		  :address              => "smtp.sendgrid.net",
		  :port                 => '587',
		  :authentication       => :plain,
		  :user_name            => ENV['SENDGRID_USERNAME'],
		  :password             => ENV['SENDGRID_PASSWORD'],
		  :domain               => 'heroku.com',
		  :enable_starttls_auto => true  
		}
    mail(to: @user.email, subject: 'Welcome to IDBM Industry Project!', delivery_method_options: delivery_options)
  end

  def reset_email(user)
  	@user = user
  	delivery_options = {
		  :address              => "smtp.sendgrid.net",
		  :port                 => '587',
		  :authentication       => :plain,
		  :user_name            => ENV['SENDGRID_USERNAME'],
		  :password             => ENV['SENDGRID_PASSWORD'],
		  :domain               => 'heroku.com',
		  :enable_starttls_auto => true  
		}
    mail(to: @user.email, subject: 'IDBM Password reset instructions', delivery_method_options: delivery_options)
  end

end