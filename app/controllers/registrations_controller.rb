class RegistrationsController < Devise::RegistrationsController
    protected
        
    def after_inactive_sign_up_path_for(resource)
        home_complete_path
      end
    
end