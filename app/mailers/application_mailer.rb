class ApplicationMailer < ActionMailer::Base
	default from: 'IDBM Programme'

  def welcome_email(user)
    @user = user
    @url  = 'https://safe-earth-52111.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to IDBM Industry Project!')
  end

  def reset_email(user)
  	@user = user
    mail(to: @user.email, subject: 'IDBM Password reset instructions')
  end

end