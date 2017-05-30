class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'


  def welcome_email(user, password)
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Invitation')
  end

end
