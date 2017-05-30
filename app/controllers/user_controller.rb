class UserController < ApplicationController

 before_action :authenticate_user!
 before_action :set_role
 before_action :role


def member
	
	@user = User.where(id: current_user.id).first
end

def admin

end


def dashboard
	
end

def add_user
	@user = User.new(user_params)
	generated_password = Devise.friendly_token.first(8)
	@user.password = generated_password
	if @user.save
	# UserMailer.welcome_email(@user, generated_password).deliver
	end
	render :layout => false
end


def role

	# raise params[:action].to_yaml
	if @role.role == 'super_admin'
		#super admin...
	elsif @role.role  == 'admin' 
		if params[:action] == 'dashboard'
			redirect_to new_user_session_path
		end 
	elsif @role.role == 'member'
		if params[:action]  == 'admin' || params[:action] == 'dashboard'
			redirect_to new_user_session_path
		end

	end
end

private

def user_params
  params.require(:user).permit(:email, :first_name, :last_name)
end








end
