class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  default from: 'info@elpuntonetwork.com'
  
  def confirmation_instructions(record)
      devise_mail(record, :confirmation_instructions)
    end

    def reset_password_instructions(record)
      devise_mail(record, :reset_password_instructions)
    end

    def unlock_instructions(record)
      devise_mail(record, :unlock_instructions)
    end

    def welcome_email(user)
      @user = user
      @url  = '"http://localhost:3000/'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
