class Api::V1::RegistrationsController <  Devise::RegistrationsController
  protect_from_forgery with: :null_session
  before_action :configure_sign_up_params, only: [:create]
	def new
		super
	end

	def create
	  user = User.new(sign_up_params)
		if user.save
			token = user.generate_jwt
			render json: token.to_json
		else
			render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
		end
	end

	def configure_sign_up_params
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation, :remember_me,:role)}
   end
end

