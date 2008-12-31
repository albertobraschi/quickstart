class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject     = "#{SITE_NAME} - ative sua conta"
  
    @body[:url]  = "#{SITE_URL}activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject     = "#{SITE_NAME} - sua conta foi ativada!"
    @body[:url]  = SITE_URL
  end

  def forgot_password(user)
    setup_email(user)
    @subject     = "#{SITE_NAME} - alterar senha"
    @body[:url]  = "#{SITE_URL}reset_password/#{user.password_reset_code}"
  end

  def reset_password(user)
    setup_email(user)
    @subject     = "#{SITE_NAME} - nova senha"
  end

  def message_to_admin(subject,body)
    @admin = User.find_by_login(ADMIN_LOGIN)
    @recipients  = @admin.email
    @from        = @admin.email
    @subject     = SITE_NAME
    @sent_on     = Time.now
    @subject     = subject
    @body[:body]  = body
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = SITE_EMAIL_ADDRESS
      @subject     = SITE_NAME
      @sent_on     = Time.now
      @body[:user] = user
    end
end
