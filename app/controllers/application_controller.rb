class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :authenticate_user!
  before_action :set_role

    def layout_by_resource
  	# and user_signed_in?
   if devise_controller? 
      'application'
    else
      'admin_lte_2'
    end
  end




def set_role
	if current_user.present?
		@role ||= User.find_by_id(current_user.id)
	end
end

  private

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:first_name, :last_name,  :email, :password, :password_confirmation)
        end

        devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:first_name, :last_name,  :email, :password, :password_confirmation)
        end      
  end

def after_sign_in_path_for(resource)
    if user_signed_in?
    	if @role.present?
	 		if @role.role == 'super_admin'
	 		   dashboard_path
	 		elsif @role.role == 'admin'
	 			admin_path
	 		elsif @role.role == 'member'
	 			member_path
	 		end		
	 	else
	 	member_path
	 	end

    end
end




end
