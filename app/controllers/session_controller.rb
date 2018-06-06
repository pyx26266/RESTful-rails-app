class SessionController < ApplicationController

  def new
    redirect_to(current_user) if logged_in?
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "invalid email/password"
      render 'new'
    end
  end
  
  def destroy
    logout if logged_in?
    flash[:success] = "see you soon"
    redirect_to root_path
  end
end
