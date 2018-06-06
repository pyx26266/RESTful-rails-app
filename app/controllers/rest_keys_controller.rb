class RestKeysController < ApplicationController
  before_action :logged_in_user
  
  def create
    key = current_user.build_rest_key(key: SecureRandom.urlsafe_base64)
    key.save
    redirect_to current_user
  end
end
