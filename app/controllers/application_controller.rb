class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  
  private
  def logged_in_user
    unless logged_in?
      # store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def admin_user
    flash[:warning] = "Only admin can do that."
    if logged_in?
      redirect_to current_user
    else
      redirect_to login_path
    end
  end
end
