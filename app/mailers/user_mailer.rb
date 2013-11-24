class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  default :from => 'info@elpuntonetwork.com'

    def welcome_email(user)
      @user = user
      @url  = '"http://localhost:3000/'
      mail(:to => user.email, :subject => "Welcome")
    end
end
