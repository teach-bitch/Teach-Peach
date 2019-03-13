class AdminsController < ApplicationController
	before_action :require_admin

  def require_admin
		if user_signed_in?
	    puts "***********"
	    puts params
			unless current_user.role == "admin"
				redirect_to root_path
			end
		else
			redirect_to root_path
		end
	end
end

