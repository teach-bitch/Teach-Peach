class ShopController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_is_user_minor

  private

  def redirect_if_is_user_minor
  	if current_user.role == "user_minor"
  		redirect_to root_path
  	end
  end
end