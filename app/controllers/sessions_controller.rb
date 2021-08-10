class SessionsController < Devise::SessionsController

	def new
		 super

	end

	def create
    pa = sign_in_params[:password]
    username = sign_in_params[:user]
    @user = User.where(["email = ? or username = ?", params[:user][:user], params[:user][:user]]).first



    if @user.blank?  
      flash[:error] = "invalid username and username can't be blank"
      redirect_to user_session_path
    elsif !@user.blank? && @user.valid_password?(pa)
     sign_in @user
     redirect_to root_path
   elsif pa.blank?
    flash[:error] = " password can't be blank "
    render 'new'
  else
    flash[:error] = " password is invalid "
    render 'new'
  end
end
end

