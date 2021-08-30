class Api::V1::SessionsController < Devise::SessionsController

	def new
		super
	end
    
     def create
        user = User.find_by_email(params[:session][:email])
        token = user.generate_jwt
        if user && user.valid_password?(params[:session][:password])
           @current_user = user
           render json: { message: { 'email or password' => ['Success'] },user: user ,token:token}, status: 200
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
     end
end