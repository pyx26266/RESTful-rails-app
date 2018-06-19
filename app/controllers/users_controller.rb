class UsersController < ApplicationController
  before_action :user_active, only: [:new, :create]
  before_action :admin_user, only: [ :destroy]
  def new
    @user = User.new
  end
  
  def show
    if logged_in?
      @user = current_user
      @photo = Photo.new
    else
      redirect_to root_path
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "successful sign-up"
      redirect_to users_url
    else
      flash[:warning] = "Something wrong!"
      render 'new'
    end
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   respond_to do |format|
      format.js
   end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_active
    redirect_to(current_user) if logged_in?
  end
end
