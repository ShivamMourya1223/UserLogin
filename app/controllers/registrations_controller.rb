class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create
		super
		if !@user.blank?
			@role=Role.find_by_name(params[:user][:role])
			@user.user_roles.create(role: @role)    
		end
	end

end  