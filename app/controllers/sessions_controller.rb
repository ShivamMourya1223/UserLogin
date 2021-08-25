class SessionsController < Devise::SessionsController

	def new
   super
 end

 def create
  pa = sign_in_params[:password]
  username = sign_in_params[:user]
  @user = User.where(["email = ? or username = ?", params[:user][:user], params[:user][:user]]).first



  if @user.blank?  
    flash[:alert] = "invalid username and username can't be blank"
    redirect_to user_session_path
  elsif !@user.blank? && @user.valid_password?(pa)
   sign_in @user
   redirect_to root_path
 elsif pa.blank?
  flash[:alert] = " password can't be blank "
  redirect_to user_session_path
else
  flash[:alert] = " password is invalid "
  redirect_to user_session_path
end
end
end

